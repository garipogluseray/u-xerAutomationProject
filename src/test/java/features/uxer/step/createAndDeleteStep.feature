Feature: Create And Delete Step

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * def createStep = karate.callSingle(callersPath + '/step/createStepCallers.feature@createStepCallers')
    * def step = createStep.response
    * def step2 = karate.extract(step, '([^\\"]+)"', 1)
    * def stepId = step2

  @regression
  Scenario: Create And Delete Step
    Given path step_service_path+"/"+stepId
    When method DELETE
    Then status 200
    And match response == 'true'
