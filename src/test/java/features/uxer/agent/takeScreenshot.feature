Feature: Take Screenshot

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @regression
  Scenario: Take Screenshot
    Given path agent_service_path+"/"+agentIdTest1+"/screenshot"
    When request {}
    When method POST
    Then status 200

    #Testin fail almaması için agentIdTest1 agennt'ın bağlı olmalı