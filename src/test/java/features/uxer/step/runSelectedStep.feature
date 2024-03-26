Feature: Run Selected Step

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'step/runSelectedStepRequest.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Run Selected Step
    Given path step_service_path+"/run/agent/"+agentIdTest1
    When request rqJson
    When method POST
    Then status 200