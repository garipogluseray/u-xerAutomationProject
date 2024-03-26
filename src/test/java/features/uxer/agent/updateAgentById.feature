Feature: Update Agent By Id

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'agent/UpdateAgentByIdRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Update Agent By Id
    Given path agent_service_path+"/"+agentIdTest2
    * set rqJson.name = "AgentTestAutomationNameUpdated"
    * set rqJson.description = "AgentTestAutomationDescriptionUpdated"
    * set rqJson.maxWorkers = 4
    When request rqJson
    When method PUT
    Then status 200
    And match response == 'true'
