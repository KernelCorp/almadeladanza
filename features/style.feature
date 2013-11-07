Feature: Style

  Scenario: show for guest
    Given DanceStyle with name: "first", description: "first desc"
      And DanceStyle with name: "second", description: "second desc"
    When I go to "/Dance_styles"
    Then I should see DanceStyles list with 2 items: "first" "second"
     And Element "first" is active
     And I should see description: "first desc"

  Scenario: click to DanceStyle name
    Given DanceStyle with name: "first", description: "first desc"
      And DanceStyle with name: "second", description: "second desc"
    When I go to "/Styles"
     And I click to list element "second"
    Then I should see description: "second desc"
     And Element "second" is active

  Scenario: admin looks to Style
    Given I sign in as admin
      And DanceStyle with name: "first", description: "first desc"
    When I go to "/admin"
     And I click on button "Dance style"
    Then I should see action "create"
     And I should see action "edit"
     And I should see action "show"
     And I should see action "delete"

  Scenario: admin create new DanceStyle
    Given I sign in as admin
    When I go to "/admin"
     And I click on button "Create"
    Then I should see form for "DanceStyle"
     And I should see checkboxes for coaches