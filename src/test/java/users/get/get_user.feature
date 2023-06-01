Feature: Delete user in dummyapi

  Background: setUp
    * def config = call read('../../karate-config.js')
    * url config.url
    * def appId = config.appId
    * configure headers = {app-id: '#(appId)'}
    * def generate = Java.type('utils.Generate')

  @GetuserById
  Scenario: Get user by id
    * call read('../post/create_user.feature@CreateUserSuccesfull')
    Given path 'user/'
    And path userId
    When method get
    Then status 200
    And match response.id == userId

  @GetAllUsers
  Scenario: Get all users
    Given path 'user/'
    When method get
    Then status 200
    And match response.total != 0
    * print response

  @GetUserByIdIncorrect
  Scenario: Get user by id incorrect
    * def userId = generate.idIncorrect()
    Given path 'user/'
    And path userId
    When method get
    Then status 400
    And match response.error == 'PARAMS_NOT_VALID'
    * print response

  @GetAllUserWithAppIdIncorrect
  Scenario: Get all users with app-id incorrect
    * call read('../post/create_user.feature@CreateUserSuccesfull')
    * configure headers = {app-id:'74a50257e775130b1bb1222'}
    Given path 'user/'
    And path userId
    When method get
    Then status 403
    And match response.error == 'APP_ID_NOT_EXIST'
    * print response

  @GetAllUserWithPathIncorrect
  Scenario: Get all users with path incorrect
    * def userId = generate.idIncorrect()
    Given path 'users/'
    And path userId
    When method get
    Then status 404
    And match response.error == 'PATH_NOT_FOUND'
    * print response










