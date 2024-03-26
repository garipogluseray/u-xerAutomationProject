Feature: Create And Delete Project

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * def createProject = karate.callSingle(callersPath + '/project/createProjectCallers.feature@createProjectCallers')
    * print createProject.response
    * def project = createProject.response
    * def project2 = karate.extract(project, '([^\\"]+)"', 1)
    * def projectId = project2

  @regression
  Scenario: Create And Delete Project
    Given path project_service_path+"/"+projectId
    When method DELETE
    Then status 200
    And match response == 'true'
