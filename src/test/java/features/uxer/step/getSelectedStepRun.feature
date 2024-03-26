Feature: Get Selected Step Run

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: RGet Selected Step Run
    Given path step_service_path+"/"+stepIdTest1+"/run/agent/"+agentIdTest1
    When method GET
    Then status 200