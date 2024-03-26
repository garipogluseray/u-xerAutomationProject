Feature: Upload Scenario

  Background:
    * url baseUrl
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Authorization = 'Bearer ' + accessTokens.accessToken
    * header Content-Type = 'application/json'
    * header accept = '*/*'

  @regression
  Scenario: Upload Scenario
    Given path scenario_service_path+"/"+"upload"
    * header Content-Type = 'multipart/form-data'
    And multipart field FolderId = folderIdTest1
    And multipart field Name = "UploadScenarioTest"
    And multipart field Description = "UploadScenarioTest"
    And multipart file File = karate.read('file:target/test-classes/ImportScenarioExample.txt'}
    When method POST
    * print response
    Then status 200