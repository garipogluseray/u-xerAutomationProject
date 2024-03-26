Feature: Create Step By ScenarioId

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'scenario/createStepByScenarioIdRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Create Step By ScenarioId
    Given path scenario_service_path+"/"+scenarioIdTest2+"/steps"
    When request rqJson
    When method PUT
    Then status 200
