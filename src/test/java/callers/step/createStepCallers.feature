@createStepCallers
Feature: Create Step Callers

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'step/createStepRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Create Step Callers
    Given path step_service_path
    * set rqJson.scenarioId = scenarioIdTest3
    When request rqJson
    When method POST
    Then status 200
    * print response