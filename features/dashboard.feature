Feature: Dashboard


  Scenario: Logged user can access dashboard
    Given I am a new, authenticated user
    And I am on the dashboard page
    Then I should be on the dashboard page
