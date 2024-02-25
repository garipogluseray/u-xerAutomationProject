@DeleteAgentById
Feature: Delete Api Agent By Id

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Delete Api Agent By Id
    * print agentId
    Given path agent_service_path+"/"+agentId
    When method DELETE
    Then status 200
    And match response == 'true'
