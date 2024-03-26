Feature: Get Agent By Id

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Get Agent By Id
    Given path agent_service_path+"/"+agentIdTest2
    When method GET
    Then status 200
