*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           lib/lib.py

*** Variables ***

*** Test Cases ***
Write test script to execute API (GET Method) with Robot Framework.
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com    verify=True
    ${Response}=    Get request    jsonplaceholder    /users
    #Validate
    #HTTP Status code
    Should Be Equal As Strings    ${Response.status_code}    200
    #Response Return type
    ${result}=    Check_data_type    ${Response.json()}
    Should Be Equal    ${result}    list
    #Response Data type
    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    #Response Data size
    Get Length    ${Response.content}

Write test script to execute API (POST Method) with Robot Framework.
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com    verify=True
    &{data}=    Create dictionary    title=Welcome Robotframework    body=Body DATA    userId=1
    ${Response}=    Post request    jsonplaceholder    /posts    json=${data}
    #Dictionary Should Contain Key    ${Response.json()}    id
    #HTTP Status code
    Should Be Equal As Strings    ${Response.status_code}    201
    #Response Header
    ${HeaderDATA}=    Convert To String    ${Response.headers}
    #Response match with Request
    ${dataValidate}=    Convert To String    ${Response.content}
    Should Contain    ${dataValidate}    "Welcome Robotframework"
    Should Contain    ${dataValidate}    "Body DATA"
    Should Contain    ${dataValidate}    "1"

*** Keywords ***
