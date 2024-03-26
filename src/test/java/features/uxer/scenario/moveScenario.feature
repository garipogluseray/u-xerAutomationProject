Feature: Copy the Scenario to another folder

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
  Scenario: Copy the Scenario to another folder
    Given path scenario_service_path+"/"+scenarioId+"/move/"+folderIdTest1
    When request {}
    When method PUT
    Then status 200
    * karate.callSingle(callersPath + '/scenario/deleteScenarioCallers.feature@deleteScenarioByIdCallers')