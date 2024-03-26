Feature: Create Agent

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * def createAgent = karate.callSingle(callersPath + '/agent/postApiAgentCallers.feature@postApiAgentCallers')
    * def agent = createAgent.response
    * def agent2 = karate.extract(agent, '([^\\"]+)"', 1)
    * def agentId = agent2

  @regression
  Scenario: Create Agent
    Given path agent_service_path+"/"+agentId
    When method DELETE
    Then status 200
    And match response == 'true'
