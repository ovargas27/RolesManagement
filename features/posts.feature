Feature: Guest user
  In order to test system security
  As a Guest user
  I want to test my access privileges

  Background:
    Given I am not authenticated

  Scenario: Can see post list
    Given I am on the posts list page
    Then I should be on the posts list page

  Scenario: Can see post
    Given I am visit post page
    Then I should be on the post page

  @allow-rescue
  Scenario: Can't create post
    Given I am try to create new post
    Then I should be redirected to the login page

  @allow-rescue
  Scenario: Can't edit post
    Given I am try to edit post
    Then I should be redirected to the login page

  # Scenario: Can't destroy post
  #   Given I am on the dashboard page
  #   Then I should be redirected to the login page

  Scenario: Can't access dashboard
    Given I am on the dashboard page
    Then I should be redirected to the login page
