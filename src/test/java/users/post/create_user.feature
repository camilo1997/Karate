Feature: Create user

  Background: setUp
    * def config = call read('../../karate-config.js')
    * url config.url
    * def appId = config.appId
    * configure headers = {app-id: '#(appId)'}
    * def generate = Java.type('utils.Generate')
    * def firstName = generate.firstName()
    * def lastName = generate.lastName()

  @CreateUserSuccesfull
  Scenario: create user successfully
    * def email = generate.email()
    * def body = read('../../utils/body.json')
    Given path 'user/create'
    And request body
    When method post
    Then status 200
    And def userId = $.id

  @CreateUserWithEmailUsed
  Scenario: Create user with email already used
    * def email = 'test@test.com'
    * def body = read('../../utils/body.json')
    Given path 'user/create'
    And request body
    When method post
    Then status 400
    And match response contains {error:'BODY_NOT_VALID'}
    And match response.data.email contains 'Email already used'
    * print response

  @CreateUserWithouEmail
  Scenario: Create user without email
    Given path 'user/create'
    And request {firstName:"Camilo", lastName:"Lopera"}
    When method post
    Then status 400
    And match response contains {error:'BODY_NOT_VALID'}
    And match response.data.email contains 'Path `email` is required.'
    * print response

  @CreateUserWithEmailIncorrect
  Scenario: create user with email incorrect
    * def email = generate.emailIncorrect()
    * def body = read('../../utils/body.json')
    Given path 'user/create'
    And request body
    When method post
    Then status 400
    And match response contains {error:'BODY_NOT_VALID'}
    And match response.data.email contains 'Path `email` is invalid'
    * print response




