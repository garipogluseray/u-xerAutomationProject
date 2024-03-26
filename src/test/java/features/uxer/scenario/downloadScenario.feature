Feature: Download Scenario

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'scenario/updateScenarioRequest.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Download Scenario
    Given path scenario_service_path+"/"+scenarioIdTest1+"/download"
    When request rqJson
    When method GET
    Then status 200