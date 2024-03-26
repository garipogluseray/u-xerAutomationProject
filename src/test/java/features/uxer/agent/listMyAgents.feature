Feature: List My Agents

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'agent/listMyAgentsRequest.json')
    * def resJson = read (dataPath + 'agent/listMyAgentsResponse.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type =  'application/json'


  @regression
  Scenario: List My Agents
    Given path agent_service_path+"/mine"
    When request rqJson
    When method POST
    Then status 200


