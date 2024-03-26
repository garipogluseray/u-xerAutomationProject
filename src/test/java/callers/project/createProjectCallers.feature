@createProjectCallers
Feature: Create Project Caller

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'project/createProjectRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Create Project Caller
    Given path project_service_path
    * set rqJson.accountId = accountId
    When request rqJson
    When method POST
    Then status 200
    * print response