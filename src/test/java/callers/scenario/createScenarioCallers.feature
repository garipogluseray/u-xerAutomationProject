@createScenarioCallers
Feature: Post Api Scenario

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'scenario/createScenarioRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Post Api Agent
    Given path scenario_service_path
    When request rqJson
    When method POST
    Then status 200
    * print response