*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Test Setup    Open Browser    browser=chrome

*** Variables ***
${URL}    https://saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce


*** Test Cases ***
SuccessFul Login
    I navigate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I am able view the home page
    
    

Unsuccessful Login - No credentials
    I navigate to the login page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Username is required

Unsuccessful Login - No Username
    I navigate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Username is required


Unsuccessful Login - No password
    I navigate to the login page    ${URL}
    I input only the username    ${USERNAME}
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Password is required


Unsuccessful Login - Wrong credentials
    I navigate to the login page    ${URL}
    Wait Until Element Is Visible    id=user-name
    Input text    id=user-name    nsnms
    Input text    id=password    mms,s
    I click on the login button
    I am able to see the expected erro message    Epic sadface: Username and password do not match any user in this service