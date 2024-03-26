Feature: Update Scenario Name and Description

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'scenario/updateScenarioRequest.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Update Scenario Name and Description
    Given path scenario_service_path+"/"+scenarioIdTest1
    When request rqJson
    When method PUT
    Then status 200
    And match response == 'true'