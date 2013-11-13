Feature: Interiors
  In order that an admin can add photos and users can see ones

  Scenario: add photos
    Given I sign in as admin
    When I go to "/admin"
    And I click on button "Interior Images"
    And I add image "../../../public/images/logo.png"
    Then I should see image "../../../public/images/logo.png" in images list

  Scenario: delete image
    Given I sign in as admin
    And Interiors contain image "../../../public/images/logo.png"
    When I go to "/admin"
    And I click on button "Interior Images"
    And I click on button "Delete"
    Then Image "../../../public/images/logo.png" should be removed from image list

  Scenario: show Interiors
    Given Interiors contain image "../../../public/images/logo.png"
    When I go to "/interiors"
#    And I click on button "Interiors"   NO INDEX PAGE YET
    Then I should see carousel
    And I should see image "../../../public/images/logo.png"

