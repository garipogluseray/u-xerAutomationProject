Feature: NotDefault  Agent

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @smoke
  Scenario: NotDefault  Agent
    Given path agent_service_path+"/"+agentIdTest2+"/notdefault"
    When request {}
    When method PUT
    Then status 200
    And match response == 'true'