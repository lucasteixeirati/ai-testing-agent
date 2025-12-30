*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Setup Test Environment
    Log    Setting up test environment with browser: ${BROWSER}, headless: ${HEADLESS_MODE}
    
    # Close any existing browsers
    Close All Browsers
    
    # Initialize browser conditionally
    Run Keyword If    '${HEADLESS_MODE}' == 'True'    Open Headless Browser    ${BROWSER}
    ...    ELSE    Open Browser    ${BASE_URL}    ${BROWSER}
    
    # Configure browser window
    Run Keyword And Ignore Error    Maximize Browser Window
    Set Browser Implicit Wait    5
    
    Log    Test environment setup completed successfully

Teardown Test Environment
    Log    Tearing down test environment
    
    # Close all browsers and cleanup
    Close All Browsers
    
    Log    Test environment teardown completed

Open Headless Browser
    [Arguments]    ${browser_name}=Chrome
    Log    Opening headless browser: ${browser_name}
    
    Run Keyword If    '${browser_name}' == 'Firefox'    Open Headless Firefox Browser
    ...    ELSE IF    '${browser_name}' == 'Edge'    Open Headless Edge Browser
    ...    ELSE    Open Headless Chrome Browser
    
    # Navigate to base URL after browser creation
    Go To    ${BASE_URL}
    
    Log    Headless browser opened successfully

Open Headless Chrome Browser
    # Create Chrome options with comprehensive settings
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    # Core headless arguments
    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    
    # Window and display settings
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-plugins
    
    # Performance optimizations
    Call Method    ${chrome_options}    add_argument    --disable-background-timer-throttling
    Call Method    ${chrome_options}    add_argument    --disable-renderer-backgrounding
    Call Method    ${chrome_options}    add_argument    --disable-backgrounding-occluded-windows
    
    # Security and stability - disable problematic features
    Call Method    ${chrome_options}    add_argument    --disable-web-security
    Call Method    ${chrome_options}    add_argument    --disable-features=TranslateUI
    Call Method    ${chrome_options}    add_argument    --disable-ipc-flooding-protection
    Call Method    ${chrome_options}    add_argument    --disable-background-networking
    Call Method    ${chrome_options}    add_argument    --disable-sync
    Call Method    ${chrome_options}    add_argument    --disable-default-apps
    Call Method    ${chrome_options}    add_argument    --disable-component-extensions-with-background-pages
    
    # Disable GCM registration to avoid PHONE_REGISTRATION_ERROR
    Call Method    ${chrome_options}    add_argument    --disable-features=VizDisplayCompositor
    Call Method    ${chrome_options}    add_argument    --disable-background-mode
    
    # Create webdriver with options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    
    Log    Chrome headless browser created with optimized settings

Open Headless Firefox Browser
    # Create Firefox options
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    
    # Add headless argument
    Call Method    ${firefox_options}    add_argument    --headless
    
    # Set window size
    Call Method    ${firefox_options}    add_argument    --width=1920
    Call Method    ${firefox_options}    add_argument    --height=1080
    
    # Create webdriver
    Create Webdriver    Firefox    firefox_options=${firefox_options}
    
    Log    Firefox headless browser created

Open Headless Edge Browser
    # Create Edge options
    ${edge_options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    
    # Add headless arguments
    Call Method    ${edge_options}    add_argument    --headless
    Call Method    ${edge_options}    add_argument    --disable-gpu
    Call Method    ${edge_options}    add_argument    --window-size=1920,1080
    
    # Create webdriver
    Create Webdriver    Edge    edge_options=${edge_options}
    
    Log    Edge headless browser created

Take Screenshot On Failure
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${test_name}=    Set Variable    ${TEST_NAME}
    ${safe_test_name}=    Replace String    ${test_name}    ${SPACE}    _
    ${screenshot_name}=    Set Variable    failure_${safe_test_name}_${timestamp}.png
    
    Run Keyword And Ignore Error    Capture Page Screenshot    ${screenshot_name}
    
    Log    Screenshot captured: ${screenshot_name}