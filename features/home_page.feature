Feature: Home Page
  As a visitor
  I want to visit the home page
  So that I can see the application is working

  Scenario: Visit home page
    Given I visit the home page
    Then I should see "Loading..."
    And the page should be successful

  @javascript
  Scenario: Home page with JavaScript
    Given I visit the home page
    Then I should see the React application loaded
    And I should see "Loading..."