Feature: Lightning Talk Signup
  In order to notify others in my ideas for talks
  As a potential presenter
  I want to enter my talk ideas into the philly.rb website

  Scenario: Enter an idea for a talk
    Given I am on the philly.rb lightning talk form
    And I enter my email address
    And I enter a short description for my talk
    When I submit the form
    Then I should be notified that my talk idea has been stored

  Scenario: Validating an idea for a talk
    Given a talk idea entered into the lightning talk form
    And the talk idea is associated with a verified email address
    Then the talk should be saved
