Feature: Put Account By AccountId

  Background:
    * url baseUrl
    * def rqJson = read (dataPath + 'account/updateAccountByIdRequest.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @smoke
  Scenario: Put Account By AccountId
    Given path account_service_path+accountId
    When request rqJson
    When method PUT
    Then status 200
    And match response == 'true'