Feature: Create Scenario By FolderId

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'scenario/createScenarioByFolderIdRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Create Scenario By FolderId
    Given path scenario_service_path
    * def folderId = folderIdTest1
    When request rqJson
    When method POST
    Then status 200
    * def scenario = response
    * def scenario2 = karate.extract(scenario, '([^\\"]+)"', 1)
    * def scenarioId = scenario2
    * karate.callSingle(callersPath + '/scenario/deleteScenarioCallers.feature@deleteScenarioByIdCallers')