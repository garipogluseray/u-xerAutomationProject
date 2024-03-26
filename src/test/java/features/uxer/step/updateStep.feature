Feature: Update Step

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * def rqJson = read (dataPath + 'step/updateStepRequest.json')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'


  @regression
  Scenario: Update Step Classifier,Text and Index
    Given path step_service_path+"/"+stepIdTest2
    * set rqJson.step.expression.Location[0].Classifier = "InputLabel"
    * set rqJson.step.expression.Location[0].Text = "Automation Test"
    * set rqJson.step.expression.Location[0].Index = 2
    When request rqJson
    When method PUT
    Then status 200
    And match response == 'true'

  Scenario: Update again and revert the step parameters to their previous state.
    Given path step_service_path+"/"+stepIdTest2
    When request rqJson
    When method PUT
    Then status 200
    And match response == 'true'