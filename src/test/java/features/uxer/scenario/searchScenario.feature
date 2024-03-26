Feature: Search Scenario

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'scenario/searchScenarioRequest.json')
    * def resJson = read (dataPath + 'scenario/searchScenarioResponse.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Search Scenario with searchText
    Given path scenario_service_path+"/search"
    * set rqJson.searchText = "AutomationTest"
    When request rqJson
    When method POST
    Then status 200