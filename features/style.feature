Feature: Style

  @javascript
  Scenario: show for guest
    Given DanceStyle with name: "first", description: "first desc"
      And DanceStyle with name: "second", description: "second desc"
    When I go to "/dance_styles"
    Then I should see DanceStyles list with 2 items: "first" "second"
     And Element "first" is active
     And I should see description: "first desc"

  @javascript
  Scenario: click to DanceStyle name
    Given DanceStyle with name: "first", description: "first desc"
      And DanceStyle with name: "second", description: "second desc"
    When I go to "/dance_styles"
     And I click to list element "second"
    Then I should see description: "second desc"
     And Element "second" is active

  Scenario: admin looks to Style
    Given I sign in as admin
      And DanceStyle with name: "first", description: "first desc"
    When I go to "/admin"
     And I click on button "Dance Styles"
    Then I should see action Create
     And I should see action "Edit"
     And I should see action "View"
     And I should see action "Delete"

  Scenario: admin creates new DanceStyle
    Given I sign in as admin
    When I go to "/admin/dance_styles"
     And I click on button "New Dance Style"
    Then I should see form for "DanceStyle"
     And I should see checkboxes for coaches