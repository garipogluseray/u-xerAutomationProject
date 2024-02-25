Feature: Preview

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'agent/previewRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Preview
    Given path agent_service_path+"/"+agentIdTest1+"/preview"
    When request rqJson
    When method POST
    Then status 200

    #Testin fail almaması için agentIdTest1 agennt'ın bağlı olmalı