Feature: Direction

  Scenario: show for guest
    Given direction with name: "first", description: "first desc"
      And direction with name: "second", description: "second desc"
    When I go to "/directions"
    Then I should see directions list with 2 items: "first" "second"
     And Element "first" is active
     And I should see description: "first desc"

  Scenario: click to direction name
    Given direction with name: "first", description: "first desc"
      And direction with name: "second", description: "second desc"
    When I go to "/directions"
     And I click to list element "second"
    Then I should see description: "first desc"
     And Element "second" is active

  Scenario: admin looks to direction
    Given I sign in as admin
      And direction with name: "first", description: "first desc"
    When I go to "/admin"
     And I click to button "Direction"
    Then I should see action "create"
     And I should see action "edit"
     And I should see action "show"
     And I should see action "delete"

  Scenario: admin create new direction
    Given I sign in as admin
    When I go to "/admin"
     And I click to button "Create"
    Then I should see form for "direction'
     And I should see checkboxes for coaches