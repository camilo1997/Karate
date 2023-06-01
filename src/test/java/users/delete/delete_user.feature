Feature: Delete user


  Background: setup
    * def config = call read('../../karate-config.js')
    * url config.url
    * def appId = config.appId
    * configure headers = {app-id: '#(appId)'}
    * def generate = Java.type('utils.Generate')

  @DeleteUserSuccessfully
  Scenario: Delete user existing successfully
    * call read('../post/create_user.feature@CreateUserSuccesfull')
    Given path 'user/'
    And path userId
    When method delete
    Then status 200
    And match response.id == userId
    * print response

  @DeleteUserThatNotExist
  Scenario: Delete user that not exist in
    * def userId = generate.idIncorrect()
    Given path 'user/'
    And path userId
    When method delete
    Then status 400
    And match response.error == 'PARAMS_NOT_VALID'
    * print response