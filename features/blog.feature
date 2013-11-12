Feature: Blog
  In order to blogging

  Scenario: posts index page
    Given Coach named "Stek", Style - "yoga"
      And post with title - "The best of the stek" and preview - "Stek1" and text - "I'm the best" written by "Stek"
      And post with title - "The stek" and preview - "Stek2" an text - "maybe I'm not the best" written by "Stek"
     When I go to "/posts"
     Then I should see meta title - "Блог школы танцев Almadeladanza"
      And I should see mete description - "Статьи о танцах от ведущих тренеров Новосибирска"
      And I should 2 posts
      And I should see title "The best of the stek"
      And I should see title "The stek"
      And I should see preview "Stek1"
      And I should see preview "The Stek2"

  Scenario: Show post
    Given Coach named "Stek", Style - "yoga"
      And post with title - "The best of the stek" and preview - "Stek1" and text - "I'm the best" written by "Stek"
    When I go to "/posts/the-best-of-the-stek"
    Then I should see title "The best of the stek"
     And I should see preview "Stek1"
     And I should see text - "I'm the best"
     And I should see stek's avatar

  Scenario: manage posts
    Given Coach named "Stek", Style - "yoga"
      And Coach named "Mitya",Style - "close dance"
      And post with title - "The best of the stek" and preview - "Stek1" and text - "I'm the best" written by "Stek"
      And post with title - "The stek" and preview - "Stek2" an text - "maybe I'm not the best" written by "Mitya"
      And I sign in as "Stek"
    When I go to "/admin/posts"
    Then I should see action "show"
     And I should see action "delete"
     And I should see action "edit"
     And I should see button "creat"
     And I should see post named "The best of the stek"
     But I should not see post named "The stek"







