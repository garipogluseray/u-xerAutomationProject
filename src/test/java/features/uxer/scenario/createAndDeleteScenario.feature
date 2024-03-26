Feature: Create And Delete Scenario

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * def createScenario = karate.callSingle(callersPath + '/scenario/createScenarioCallers.feature@createScenarioCallers')
    * def scenario = createScenario.response
    * def scenario2 = karate.extract(scenario, '([^\\"]+)"', 1)
    * def scenarioId = scenario2

  @regression
  Scenario: Create And Delete Scenario
    Given path scenario_service_path+"/"+scenarioId
    When method DELETE
    Then status 200
    And match response == 'true'
