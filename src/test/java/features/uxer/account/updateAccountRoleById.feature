Feature: Update Account Role By Id

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'account/updateAccountRoleByIdRequest.json')
    * def resJson = read (dataPath + 'account/updateAccountRoleByIdResponse.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Update Account Role By Id
    Given path account_service_path+accountId+'/users'
    * set rqJson[0].userId = userId
    * set rqJson[0].role = "Admin"
    When request rqJson
    * print rqJson
    When method PUT
    Then status 200
    * print response
    And match response[0].success == true



