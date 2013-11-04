Feature: Galleries

  Scenario: show gallery
    Given Gallery named "g1"
      And Gallery named "g2"
      And 3 photo in gallery "g1"
      And 2 photo in gallery "g2"
    When I go to "/gallery"
    Then I should see 5 photos
     And I should see list of galleries

  Scenario: show specific gallery
    Given Gallery named "g1"
    And Gallery named "g2"
    And 3 photo in gallery "g1"
    And 2 photo in gallery "g2"
    When I go to "/galleries"
     And I click to list element "g1"
    Then I should see 3 photo

  Scenario: admin can add galleries
    Given sign in as admin
    When I go to "/admin/galleries"
     And I click to button "Create"
    Then I should see form for "gallery"
     And I should see input for "title"

  Scenario: admin can add photos
    Given sign in as admin
      And Gallery named "g2"
    When I go to "/admin/galleries"
     And I click to link "add photo"
    Then I should see form for upload images
