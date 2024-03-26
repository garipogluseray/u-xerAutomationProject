Feature: Duplicate Project
  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'project/updateProjectRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken


  @regression
  Scenario: Duplicate Project
    Given path project_service_path+"/"+projectIdTest2+"/duplicate"
    When request {}
    When method PUT
    Then status 200
    * def project = response
    * def project2 = karate.extract(project, '([^\\"]+)"', 1)
    * def projectId = project2
    * karate.callSingle(callersPath + '/project/deleteProjectCallers.feature@deleteProjectByIdCallers')