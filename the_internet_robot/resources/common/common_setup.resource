*** Settings ***
Library    SeleniumLibrary
Resource   headless_keywords.resource  # Onde a lógica Headless está definida

*** Variables ***
${BASE_URL}     https://the-internet.herokuapp.com/
${BROWSER}      Chrome
${HEADLESS_MODE}    False  # Padrão: Execução Local (Headed)