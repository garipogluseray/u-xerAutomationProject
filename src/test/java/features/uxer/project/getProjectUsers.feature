Feature: Get Project Users
  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Get Project Users
    Given path project_service_path+"/"+projectIdTest1+"/users"
    When method GET
    Then status 200