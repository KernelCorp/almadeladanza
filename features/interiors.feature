Feature: Interiors
  In order that an admin can add photos and users can see ones

  Scenario: add photos
    Given I sign in as "admin"
    When I go to "/admin"
    And I click to "Interiors"
    And I add image "http://placekitten.com/g/200/300"
    Then I should see image "http://placekitten.com/g/200/300" in images list

  Scenario: delete image
    Given I sign in as "admin"
    And Interiors contains image "http://placekitten.com/g/200/300"
    When I go to "/admin"
    And I click to "Interiors"
    And I click to "Remove"
    Then Image "http://placekitten.com/g/200/300" should be removed from image list

  Scenario:  show Interiors
    Given Interiors contains image "http://placekitten.com/g/200/300"
    When I go to "/"
    And I click to "Interiors"
    Then I should see carousel
    And I should see image image "http://placekitten.com/g/200/300"

