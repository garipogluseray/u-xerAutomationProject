@getAccessToken
Feature: Get AToken

    Background:
    * url baseUrl
    * header Content-Type =  'application/json'
    * def rqJson = read (dataPath + 'auth/authLoginCallerRequest.json')
    * def resJson = read (dataPath + 'auth/authLoginCallerResponse.json')

    Scenario: Get by AccessToken
        Given path auth_service_path+'/login'
        When request rqJson
        When method POST
        Then status 200
        And def accessToken = response.accessToken
        * print response
