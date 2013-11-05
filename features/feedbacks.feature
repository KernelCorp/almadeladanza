Feature: Feedbacks
  A guest can write a feedback
  An admin can accept or reject

  Scenario: Add feedback
    When I go to "/"
     And I click to link "feedbacks"
     And I fill input "author" as "dancerman"
     And I fill input "text" as "ohohohohoh dance"
     And I submit form for "feedback"
    Then I should see flash message "send for moderation"

  Scenario: Accept feedback
    Given I sign in as admin
      And feedback with author "author" and text "moderate me!"
    When I go to "/admin/feedbacks"
     And I click to link "accept"
     And I go to "/"
     And I click to link "feedbacks"
    Then I should see 1 feedback from "author" with text "moderate me!"