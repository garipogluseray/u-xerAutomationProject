Feature: Search Agents

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'agent/searchAgentRequest.json')
    * def resJson = read (dataPath + 'agent/searchAgentResponse.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Search Agents with searchText
    Given path agent_service_path+"/search"
    * set rqJson.searchText = "Seray"
    When request rqJson
    When method POST
    Then status 200