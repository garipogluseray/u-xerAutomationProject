Feature: Get Project
  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Get Project by Id
    Given path project_service_path+"/"+projectIdTest1
    When method GET
    Then status 200