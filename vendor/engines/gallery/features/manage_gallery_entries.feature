@gallery_entries
Feature: Gallery Entries
  In order to have gallery_entries on my website
  As an administrator
  I want to manage gallery_entries

  Background:
    Given I am a logged in refinery user
    And I have no gallery_entries

  @gallery_entries-list @list
  Scenario: Gallery Entries List
   Given I have gallery_entries titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of gallery_entries
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @gallery_entries-valid @valid
  Scenario: Create Valid Gallery Entry
    When I go to the list of gallery_entries
    And I follow "Add New Gallery Entry"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 gallery_entry

  @gallery_entries-invalid @invalid
  Scenario: Create Invalid Gallery Entry (without title)
    When I go to the list of gallery_entries
    And I follow "Add New Gallery Entry"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 gallery_entries

  @gallery_entries-edit @edit
  Scenario: Edit Existing Gallery Entry
    Given I have gallery_entries titled "A title"
    When I go to the list of gallery_entries
    And I follow "Edit this gallery_entry" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of gallery_entries
    And I should not see "A title"

  @gallery_entries-duplicate @duplicate
  Scenario: Create Duplicate Gallery Entry
    Given I only have gallery_entries titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of gallery_entries
    And I follow "Add New Gallery Entry"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 gallery_entries

  @gallery_entries-delete @delete
  Scenario: Delete Gallery Entry
    Given I only have gallery_entries titled UniqueTitleOne
    When I go to the list of gallery_entries
    And I follow "Remove this gallery entry forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 gallery_entries
 