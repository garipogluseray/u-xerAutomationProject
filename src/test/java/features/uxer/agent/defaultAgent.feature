Feature: Default Agent

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @smoke
  Scenario: Default Agent
    Given path agent_service_path+"/"+agentIdTest2+"/default"
    When request {}
    When method PUT
    Then status 200
    And match response == 'true'