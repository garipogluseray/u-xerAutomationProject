Feature: Get Selected Step Run Without AgentId

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Get Selected Step Run Without AgentId
    Given path step_service_path+"/"+stepIdTest1+"/run"
    When method GET
    Then status 200