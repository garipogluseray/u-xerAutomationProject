Feature: Duplicate Scenario

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'scenario/duplicateScenarioRequest.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Duplicate Scenario
    Given path scenario_service_path+"/"+scenarioIdTest2+"/duplicate"
    When request rqJson
    When method PUT
    Then status 200
    * def scenario = response
    * def scenario2 = karate.extract(scenario, '([^\\"]+)"', 1)
    * def scenarioId = scenario2
    * karate.callSingle(callersPath + '/scenario/deleteScenarioCallers.feature@deleteScenarioByIdCallers')