import yaml
import os
import logging
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException, NoSuchElementException

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class CustomKeywords:
    """Custom keywords library for enhanced Robot Framework testing.
    
    This library provides intelligent waits, configuration management,
    and enhanced interaction methods for web testing.
    """
    
    def __init__(self):
        self.builtin = BuiltIn()
        self.config = self._load_config()
        logger.info("CustomKeywords library initialized successfully")
    
    def _load_config(self):
        """Load configuration from YAML file with error handling.
        
        Returns:
            dict: Configuration dictionary or default values on error
        """
        try:
            config_path = os.path.join(os.path.dirname(__file__), '..', 'config', 'test_config.yaml')
            with open(config_path, 'r', encoding='utf-8') as file:
                config = yaml.safe_load(file)
                logger.info(f"Configuration loaded from {config_path}")
                return config
        except FileNotFoundError:
            logger.warning("Configuration file not found, using default values")
            return self._get_default_config()
        except yaml.YAMLError as e:
            logger.error(f"Error parsing YAML configuration: {e}")
            return self._get_default_config()
    
    def _get_default_config(self):
        """Return default configuration values.
        
        Returns:
            dict: Default configuration dictionary
        """
        return {
            'timeouts': {
                'default': 10,
                'slow_operations': 30,
                'element_wait': 5
            },
            'environments': {
                'prod': 'https://the-internet.herokuapp.com/'
            }
        }
    
    def _parse_locator(self, locator):
        """Parse locator string into By strategy and value.
        
        Args:
            locator (str): Locator string (e.g., 'id:username', 'css:.class')
            
        Returns:
            tuple: (By strategy, locator value)
        """
        locator_mapping = {
            'id:': By.ID,
            'css:': By.CSS_SELECTOR,
            'xpath:': By.XPATH,
            'name:': By.NAME,
            'class:': By.CLASS_NAME,
            'tag:': By.TAG_NAME
        }
        
        for prefix, by_strategy in locator_mapping.items():
            if locator.startswith(prefix):
                return by_strategy, locator[len(prefix):]
        
        # Default to CSS selector if no prefix found
        return By.CSS_SELECTOR, locator
    
    @keyword("Smart Wait For Element Visible")
    def smart_wait_for_element_visible(self, locator, timeout=None):
        """Wait for element to become visible with intelligent timeout handling.
        
        Args:
            locator (str): Element locator
            timeout (int, optional): Custom timeout in seconds
            
        Returns:
            WebElement: The visible element
            
        Raises:
            TimeoutException: If element is not visible within timeout
        """
        timeout = timeout or self.config['timeouts']['default']
        
        try:
            selenium_lib = self.builtin.get_library_instance('SeleniumLibrary')
            driver = selenium_lib.driver
            wait = WebDriverWait(driver, timeout)
            
            by_strategy, locator_value = self._parse_locator(locator)
            element = wait.until(EC.visibility_of_element_located((by_strategy, locator_value)))
            
            logger.info(f"Element '{locator}' became visible within {timeout}s")
            return element
            
        except TimeoutException:
            logger.error(f"Element '{locator}' not visible after {timeout}s")
            raise
        except Exception as e:
            logger.error(f"Unexpected error waiting for element '{locator}': {e}")
            raise
    
    @keyword("Smart Wait For Element Clickable")
    def smart_wait_for_element_clickable(self, locator, timeout=None):
        """Wait for element to become clickable with intelligent timeout handling.
        
        Args:
            locator (str): Element locator
            timeout (int, optional): Custom timeout in seconds
            
        Returns:
            WebElement: The clickable element
        """
        timeout = timeout or self.config['timeouts']['default']
        
        try:
            selenium_lib = self.builtin.get_library_instance('SeleniumLibrary')
            driver = selenium_lib.driver
            wait = WebDriverWait(driver, timeout)
            
            by_strategy, locator_value = self._parse_locator(locator)
            element = wait.until(EC.element_to_be_clickable((by_strategy, locator_value)))
            
            logger.info(f"Element '{locator}' became clickable within {timeout}s")
            return element
            
        except TimeoutException:
            logger.error(f"Element '{locator}' not clickable after {timeout}s")
            raise
    
    @keyword("Get Test Data")
    def get_test_data(self, data_key):
        """Retrieve test data from configuration.
        
        Args:
            data_key (str): Key for test data
            
        Returns:
            dict: Test data dictionary or empty dict if not found
        """
        test_data = self.config.get('test_data', {}).get(data_key, {})
        logger.info(f"Retrieved test data for key '{data_key}': {bool(test_data)}")
        return test_data
    
    @keyword("Get Environment URL")
    def get_environment_url(self, env='prod'):
        """Get URL for specified environment.
        
        Args:
            env (str): Environment name (default: 'prod')
            
        Returns:
            str: Environment URL
        """
        url = self.config.get('environments', {}).get(env, self.config['environments']['prod'])
        logger.info(f"Retrieved URL for environment '{env}': {url}")
        return url
    
    @keyword("Smart Click Element")
    def smart_click_element(self, locator, timeout=None):
        """Click element with automatic wait for clickability.
        
        Args:
            locator (str): Element locator
            timeout (int, optional): Custom timeout in seconds
        """
        try:
            self.smart_wait_for_element_clickable(locator, timeout)
            selenium_lib = self.builtin.get_library_instance('SeleniumLibrary')
            selenium_lib.click_element(locator)
            logger.info(f"Successfully clicked element '{locator}'")
        except Exception as e:
            logger.error(f"Failed to click element '{locator}': {e}")
            raise
    
    @keyword("Smart Input Text")
    def smart_input_text(self, locator, text, timeout=None):
        """Input text with automatic wait for element visibility.
        
        Args:
            locator (str): Element locator
            text (str): Text to input
            timeout (int, optional): Custom timeout in seconds
        """
        try:
            self.smart_wait_for_element_visible(locator, timeout)
            selenium_lib = self.builtin.get_library_instance('SeleniumLibrary')
            selenium_lib.input_text(locator, text)
            logger.info(f"Successfully input text to element '{locator}'")
        except Exception as e:
            logger.error(f"Failed to input text to element '{locator}': {e}")
            raise
    
    @keyword("Get Timeout")
    def get_timeout(self, timeout_type='default'):
        """Get timeout value from configuration.
        
        Args:
            timeout_type (str): Type of timeout to retrieve
            
        Returns:
            int: Timeout value in seconds
        """
        timeout = self.config.get('timeouts', {}).get(timeout_type, 10)
        logger.info(f"Retrieved timeout '{timeout_type}': {timeout}s")
        return timeout
    
    @keyword("Smart Mouse Over")
    def smart_mouse_over(self, locator, timeout=None):
        """Mouse over element with enhanced hover handling.
        
        Args:
            locator (str): Element locator
            timeout (int, optional): Custom timeout in seconds
        """
        try:
            # Wait for element to be visible first
            self.smart_wait_for_element_visible(locator, timeout)
            
            # Get selenium library and perform hover
            selenium_lib = self.builtin.get_library_instance('SeleniumLibrary')
            selenium_lib.mouse_over(locator)
            
            # Small wait to allow hover effects to trigger
            import time
            time.sleep(0.5)
            
            logger.info(f"Successfully hovered over element '{locator}'")
        except Exception as e:
            logger.error(f"Failed to hover over element '{locator}': {e}")
            raise
    
    @keyword("Smart Wait For Hover Effect")
    def smart_wait_for_hover_effect(self, hover_element, effect_element, timeout=None):
        """Hover over element and wait for effect to appear.
        
        Args:
            hover_element (str): Element to hover over
            effect_element (str): Element that should appear on hover
            timeout (int, optional): Custom timeout in seconds
        """
        try:
            timeout = timeout or self.config['timeouts']['default']
            
            # First ensure hover element is visible
            self.smart_wait_for_element_visible(hover_element, timeout)
            
            # Perform hover
            self.smart_mouse_over(hover_element, timeout)
            
            # Wait for effect element to become visible
            self.smart_wait_for_element_visible(effect_element, timeout)
            
            logger.info(f"Hover effect successful: '{hover_element}' -> '{effect_element}'")
            
        except Exception as e:
            logger.error(f"Hover effect failed: '{hover_element}' -> '{effect_element}': {e}")
            raise