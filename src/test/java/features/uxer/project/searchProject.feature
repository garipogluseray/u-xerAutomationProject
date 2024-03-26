Feature: Search Project
  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'project/searchProjectRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Search Project with searchText
    Given path project_service_path+"/search"
    * set rqJson.searchText = "AutomationProjectSilmeyiniz"
    When request rqJson
    When method POST
    Then status 200