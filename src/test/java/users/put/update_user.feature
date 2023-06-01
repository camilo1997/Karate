Feature: Update user

  Background: setUp
    * def config = call read('../../karate-config.js')
    * url config.url
    * def appId = config.appId
    * configure headers = {app-id: '#(appId)'}
    * def generate = Java.type('utils.Generate')
    * def firstName = generate.firstName()
    * def lastName = generate.lastName()
    * def email = generate.email()
    * def body = read('../../utils/body.json')

  @UpdateUserSuccessfully
  Scenario: Update user that exist successfully
    * call read('../post/create_user.feature@CreateUserSuccesfull')
    Given path 'user/'
    And path userId
    And request body
    When method put
    Then status 200
    And match response.id == userId
    * print response

  @UpdateUserNotExist
  Scenario: Update user that not exist
    * def userId = generate.idIncorrect()
    Given path 'user/'
    And path userId
    And request body
    When method put
    Then status 400
    And match response.error == 'PARAMS_NOT_VALID'
    * print response