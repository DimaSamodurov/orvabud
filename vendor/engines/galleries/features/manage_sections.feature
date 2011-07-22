@sections
Feature: Sections
  In order to have sections on my website
  As an administrator
  I want to manage sections

  Background:
    Given I am a logged in refinery user
    And I have no sections

  @sections-list @list
  Scenario: Sections List
   Given I have sections titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of sections
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @sections-valid @valid
  Scenario: Create Valid Section
    When I go to the list of sections
    And I follow "Add New Section"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 section

  @sections-invalid @invalid
  Scenario: Create Invalid Section (without name)
    When I go to the list of sections
    And I follow "Add New Section"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 sections

  @sections-edit @edit
  Scenario: Edit Existing Section
    Given I have sections titled "A name"
    When I go to the list of sections
    And I follow "Edit this section" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of sections
    And I should not see "A name"

  @sections-duplicate @duplicate
  Scenario: Create Duplicate Section
    Given I only have sections titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of sections
    And I follow "Add New Section"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 sections

  @sections-delete @delete
  Scenario: Delete Section
    Given I only have sections titled UniqueTitleOne
    When I go to the list of sections
    And I follow "Remove this section forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 sections
 