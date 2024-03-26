Feature: Copy the Scenario to another folder

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Copy the Scenario to another folder
    Given path scenario_service_path+"/"+scenarioIdTest2+"/copy/"+folderIdTest1
    When request {}
    When method PUT
    Then status 200
    * def scenario = response
    * def scenario2 = karate.extract(scenario, '([^\\"]+)"', 1)
    * def scenarioId = scenario2
    * karate.callSingle(callersPath + '/scenario/deleteScenarioCallers.feature@deleteScenarioByIdCallers')