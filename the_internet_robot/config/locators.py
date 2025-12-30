# config/locators.py

# Classe para localizadores da página de Login
class LoginPageLocators:
    USERNAME_INPUT = "id:username"
    PASSWORD_INPUT = "id:password"
    LOGIN_BUTTON = "css:[type='submit']"
    SUCCESS_MESSAGE = "css:.flash.success"
    ERROR_MESSAGE = "css:.flash.error"
    LOGOUT_BUTTON = "css:.button.secondary"

# Classe para localizadores da página de Controles Dinâmicos
class DynamicControlsPageLocators:
    INPUT_TEXT_FIELD = "css:#input-example input[type='text']"
    BUTTON_ENABLE_DISABLE = "css:#input-example button"
    LOADING_BAR = "id:loading"
    CHECKBOX = "css:#checkbox-example input[type='checkbox']"
    CHECKBOX_BUTTON = "css:#checkbox-example button"

# Classe para localizadores da página de JavaScript Alerts
class JavaScriptAlertsPageLocators:
    JS_ALERT_BUTTON = "css:button[onclick='jsAlert()']"
    JS_CONFIRM_BUTTON = "css:button[onclick='jsConfirm()']"
    JS_PROMPT_BUTTON = "css:button[onclick='jsPrompt()']"
    RESULT_TEXT = "id:result"

# Classe para localizadores da página de File Upload
class FileUploadPageLocators:
    FILE_INPUT = "id:file-upload"
    UPLOAD_BUTTON = "id:file-submit"
    UPLOADED_FILES = "id:uploaded-files"

# Classe para localizadores da página principal
class HomePageLocators:
    AB_TESTING_LINK = "css:a[href='/abtest']"
    ADD_REMOVE_ELEMENTS_LINK = "css:a[href='/add_remove_elements/']"
    BASIC_AUTH_LINK = "css:a[href='/basic_auth']"
    BROKEN_IMAGES_LINK = "css:a[href='/broken_images']"
    CHALLENGING_DOM_LINK = "css:a[href='/challenging_dom']"
    CHECKBOXES_LINK = "css:a[href='/checkboxes']"
    CONTEXT_MENU_LINK = "css:a[href='/context_menu']"
    DIGEST_AUTH_LINK = "css:a[href='/digest_auth']"
    DISAPPEARING_ELEMENTS_LINK = "css:a[href='/disappearing_elements']"
    DRAG_AND_DROP_LINK = "css:a[href='/drag_and_drop']"
    DROPDOWN_LINK = "css:a[href='/dropdown']"
    DYNAMIC_CONTENT_LINK = "css:a[href='/dynamic_content']"
    DYNAMIC_CONTROLS_LINK = "css:a[href='/dynamic_controls']"
    DYNAMIC_LOADING_LINK = "css:a[href='/dynamic_loading']"
    ENTRY_AD_LINK = "css:a[href='/entry_ad']"
    EXIT_INTENT_LINK = "css:a[href='/exit_intent']"
    FILE_DOWNLOAD_LINK = "css:a[href='/download']"
    FILE_UPLOAD_LINK = "css:a[href='/upload']"
    FLOATING_MENU_LINK = "css:a[href='/floating_menu']"
    FORGOT_PASSWORD_LINK = "css:a[href='/forgot_password']"
    FORM_AUTHENTICATION_LINK = "css:a[href='/login']"
    FRAMES_LINK = "css:a[href='/frames']"
    GEOLOCATION_LINK = "css:a[href='/geolocation']"
    HORIZONTAL_SLIDER_LINK = "css:a[href='/horizontal_slider']"
    HOVERS_LINK = "css:a[href='/hovers']"
    INFINITE_SCROLL_LINK = "css:a[href='/infinite_scroll']"
    INPUTS_LINK = "css:a[href='/inputs']"
    JQUERY_UI_MENUS_LINK = "css:a[href='/jqueryui/menu']"
    JAVASCRIPT_ALERTS_LINK = "css:a[href='/javascript_alerts']"
    JAVASCRIPT_ERROR_LINK = "css:a[href='/javascript_error']"
    KEY_PRESSES_LINK = "css:a[href='/key_presses']"
    LARGE_DEEP_DOM_LINK = "css:a[href='/large']"
    MULTIPLE_WINDOWS_LINK = "css:a[href='/windows']"
    NESTED_FRAMES_LINK = "css:a[href='/nested_frames']"
    NOTIFICATION_MESSAGES_LINK = "css:a[href='/notification_message']"
    REDIRECT_LINK = "css:a[href='/redirector']"
    SECURE_FILE_DOWNLOAD_LINK = "css:a[href='/download_secure']"
    SHADOW_DOM_LINK = "css:a[href='/shadowdom']"
    SHIFTING_CONTENT_LINK = "css:a[href='/shifting_content']"
    SLOW_RESOURCES_LINK = "css:a[href='/slow']"
    SORTABLE_DATA_TABLES_LINK = "css:a[href='/tables']"
    STATUS_CODES_LINK = "css:a[href='/status_codes']"
    TYPOS_LINK = "css:a[href='/typos']"
    WYSIWYG_EDITOR_LINK = "css:a[href='/tinymce']"

# Localizadores específicos para cada página
class AddRemoveElementsPageLocators:
    ADD_ELEMENT_BUTTON = "css:button[onclick='addElement()']"
    DELETE_BUTTON = "css:.added-manually"

class CheckboxesPageLocators:
    CHECKBOX_1 = "css:input[type='checkbox']:nth-of-type(1)"
    CHECKBOX_2 = "css:input[type='checkbox']:nth-of-type(2)"

class DropdownPageLocators:
    DROPDOWN = "id:dropdown"
    OPTION_1 = "css:option[value='1']"
    OPTION_2 = "css:option[value='2']"

class HoversPageLocators:
    FIGURE_1 = "css:.figure:nth-of-type(1)"
    FIGURE_2 = "css:.figure:nth-of-type(2)"
    FIGURE_3 = "css:.figure:nth-of-type(3)"
    CAPTION = "css:.figcaption"

class InputsPageLocators:
    NUMBER_INPUT = "css:input[type='number']"

class KeyPressesPageLocators:
    INPUT_FIELD = "id:target"
    RESULT = "id:result"