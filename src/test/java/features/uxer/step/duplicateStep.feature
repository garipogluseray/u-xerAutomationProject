Feature: Duplicate Step

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'step/duplicateStepRequest.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Duplicate Step
    Given path step_service_path+"/duplicate"
    When request rqJson
    When method POST
    Then status 200
    # * print response
    # * def step = response
    # * def step2 = karate.extract(step, '([^\\"]+)"', 1)
    # * def stepId = step2
    # * karate.callSingle(callersPath + '/step/deleteStepCallers.feature@deleteStepByIdCallers')