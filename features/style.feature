Feature: Style

  Scenario: show for guest
    Given Style with name: "first", description: "first desc"
      And Style with name: "second", description: "second desc"
    When I go to "/Styles"
    Then I should see Styles list with 2 items: "first" "second"
     And Element "first" is active
     And I should see description: "first desc"

  Scenario: click to Style name
    Given Style with name: "first", description: "first desc"
      And Style with name: "second", description: "second desc"
    When I go to "/Styles"
     And I click to list element "second"
    Then I should see description: "first desc"
     And Element "second" is active

  Scenario: admin looks to Style
    Given I sign in as admin
      And Style with name: "first", description: "first desc"
    When I go to "/admin"
     And I click to button "Style"
    Then I should see action "create"
     And I should see action "edit"
     And I should see action "show"
     And I should see action "delete"

  Scenario: admin create new Style
    Given I sign in as admin
    When I go to "/admin"
     And I click to button "Create"
    Then I should see form for "Style'
     And I should see checkboxes for coaches