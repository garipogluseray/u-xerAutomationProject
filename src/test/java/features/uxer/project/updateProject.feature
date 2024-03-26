Feature: Update Project
  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'project/updateProjectRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Update Project
    Given path project_service_path+"/"+projectIdTest2
    When request rqJson
    When method PUT
    Then status 200