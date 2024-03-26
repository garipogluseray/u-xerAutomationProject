Feature: Search Step

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'step/searchStepRequest.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Search Step
    Given path step_service_path+"/search"
    * set rqJson.script = "Click Text \"Automation\" "
    * set rqJson.scenarioId = scenarioIdTest3
    When request rqJson
    When method POST
    Then status 200