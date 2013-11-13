Feature: News

  Scenario: show specific news
    Given news named "new news" with text - "I'm new"
      And news named "click me" with text - "thanks"
    When I go to "/news"
    Then I should see text "thanks"
