*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py

*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct credentials
        [Arguments]    ${USERNAME}    ${PASSWORD}
        Wait Until Element Is Visible    id=user-name
        Input Text    id=user-name    ${USERNAME}
        Input text    id=password    ${PASSWORD}

I input wrong credentials
        [Arguments]    ${WRONG_USERNAME}    ${WRONG_PASSWORD}
        Wait Until Element Is Visible    id=user-name
        Input Text    id=user-name    ${WRONG_USERNAME}
        Input text    id=password    ${WRONG_PASSWORD}

I click on the login button
    Click Button    id=login-button

I am able view the home page
    ${location}    Get Location
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html

I am able to see the expected erro message
    [Arguments]    ${ERROR_MESSAGE}
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGE}


I input only the username
    [Arguments]    ${USERNAME}
    Wait Until Element Is Visible    id=user-name
    Input text    id=user-name    ${USERNAME}

I input only the password
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input text    id=password   ${PASSWORD}    

I input no credentials
    Wait Until Element Is Visible    id=user-name 