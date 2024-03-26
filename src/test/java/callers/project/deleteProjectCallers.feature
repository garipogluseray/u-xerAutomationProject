@deleteProjectByIdCallers
Feature: Delete Project Callers

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Delete Project Callers
    Given path project_service_path+"/"+projectId
    When method DELETE
    Then status 200
    And match response == 'true'
