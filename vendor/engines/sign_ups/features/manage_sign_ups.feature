@sign_ups
Feature: Sign Ups
  In order to have sign_ups on my website
  As an administrator
  I want to manage sign_ups

  Background:
    Given I am a logged in refinery user
    And I have no sign_ups

  @sign_ups-list @list
  Scenario: Sign Ups List
   Given I have sign_ups titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of sign_ups
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @sign_ups-valid @valid
  Scenario: Create Valid Sign Up
    When I go to the list of sign_ups
    And I follow "Add New Sign Up"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 sign_up

  @sign_ups-invalid @invalid
  Scenario: Create Invalid Sign Up (without name)
    When I go to the list of sign_ups
    And I follow "Add New Sign Up"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 sign_ups

  @sign_ups-edit @edit
  Scenario: Edit Existing Sign Up
    Given I have sign_ups titled "A name"
    When I go to the list of sign_ups
    And I follow "Edit this sign_up" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of sign_ups
    And I should not see "A name"

  @sign_ups-duplicate @duplicate
  Scenario: Create Duplicate Sign Up
    Given I only have sign_ups titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of sign_ups
    And I follow "Add New Sign Up"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 sign_ups

  @sign_ups-delete @delete
  Scenario: Delete Sign Up
    Given I only have sign_ups titled UniqueTitleOne
    When I go to the list of sign_ups
    And I follow "Remove this sign up forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 sign_ups
 