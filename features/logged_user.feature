Feature: Logged user
  In order to test system security
  As a Logged User
  I want to test my access privileges

  Background:
    Given I am a new, authenticated user

  Scenario: Can see post list
    Given I am on the posts list page
    Then I should be on the posts list page

  Scenario: Can see post
    Given I am visit post page
    Then I should be on the post page

  Scenario: Can create post
    Given I am try to create new post
    Then I should be on the new post page

  Scenario: Can edit post
    Given I am try to edit post
    Then I should be on the edit post page

  Scenario: Can access dashboard
    Given I am on the dashboard page
    Then I should be on the dashboard page

