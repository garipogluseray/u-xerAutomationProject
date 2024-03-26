@deleteStepByIdCallers
Feature: Delete Scenario

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Delete Scenario
    Given path step_service_path+"/"+stepId
    When method DELETE
    Then status 200
    And match response == 'true'
