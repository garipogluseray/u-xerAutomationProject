Feature: Get Scenario By Id

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def resJson = read (dataPath + 'scenario/getScenarioByIdResponse.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Get Scenario By Id
    Given path scenario_service_path+"/"+scenarioIdTest1
    When method GET
    Then status 200
