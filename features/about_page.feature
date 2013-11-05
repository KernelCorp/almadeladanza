Feature: About page
  In order show and edit about page

  Scenario:
    When I go to "/"
    Then I should see link to "coaches"
     And I should see link to "interiors"
     And I should see link to "feedbacks"
     And I should see text about school's philosophy

  Scenario:
    Given I sign in as admin
    When I go to "/admin/about_page/edit"
    Then I should see form for "about_page"
     And I should see text area for "school's philosophy"

