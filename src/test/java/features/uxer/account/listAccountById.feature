Feature: Get by AccountId

  Background:
    * url baseUrl
    * def resJson = read (dataPath + 'account/listAccountByIdResponse.json')
    * def accessTokens = karate.callSingle(callersPath + '/getToken/getTokenCallers.feature@getAccessToken')
    * header Content-Type =  'application/json'
    * header Authorization = 'Bearer ' + accessTokens.accessToken

  @regression
    Scenario: Get by AccountId
      Given path account_service_path+"/"+accountId
      When method GET
      Then status 200

