Feature: Schedule
  In order an admin can edit schedule and user can see one
  Background:
    Given Price list with content "Naletay, podeshvelo"

  @javascript
  Scenario: show for user
    Given Style named "yoga"
      And Style named "close dance"
      And Coach named "Stek", Style - "yoga"
      And Coach named "Mitya", Style - "close dance"
      And "yoga" lesson at on "Monday" at 11:30 in hall 1 coach "Stek"
      And "yoga" lesson at on "Sunday" at 17:30 in hall 2 coach "Stek"
      And "close dance" lesson at on "Thursday" at 20:30 in hall 1 coach "Mitya"
      And "close dance" lesson at on "Monday" at 11:30 in hall 2 coach "Mitya"
    When I go to "/lessons"
    Then I should see calendar
     And I should see filter for styles
     And I should see "yoga" in cell ("Monday", 11:30), hall 1
     And I should see "yoga" in cell ("Sunday", 17:30), hall 2
     And I should see "close dance" in cell ("Monday", 11:30), hall 2
     And I should see "close dance" in cell ("Thursday", 20:30), hall 1

  @javascript
  Scenario: show lessons for specific style
    Given Style named "yoga"
      And Style named "close dance"
      And Coach named "Stek", Style - "yoga"
      And Coach named "Mitya", Style - "close dance"
      And "yoga" lesson at on "Monday" at 11:30 in hall 1 coach "Stek"
      And "yoga" lesson at on "Sunday" at 17:30 in hall 2 coach "Stek"
      And "close dance" lesson at on "Thursday" at 20:30 in hall 1 coach "Mitya"
      And "close dance" lesson at on "Monday" at 11:30 in hall 2 coach "Mitya"
    When I go to "/lessons"
     And I click to "yoga"
    Then I should see "yoga" in cell ("Monday", 11:30), hall 1
     And I should see "yoga" in cell ("Sunday", 17:30), hall 2
     But I shouldn't see "close dance" in cell ("Monday", 11:30), hall 2
     And I shouldn't see "close dance" in cell ("Thursday", 20:30), hall 1

  @javascript
  Scenario: Click to day
    Given Style named "yoga"
      And Style named "close dance"
      And Coach named "Stek", Style - "yoga"
      And Coach named "Mitya", Style - "close dance"
      And "yoga" lesson at on "Tuesday" at 11:30 in hall 1 coach "Stek"
      And "yoga" lesson at on "Sunday" at 17:30 in hall 2 coach "Stek"
      And "close dance" lesson at on "Thursday" at 20:30 in hall 1 coach "Mitya"
      And "close dance" lesson at on "Monday" at 11:30 in hall 2 coach "Mitya"
    When I go to "/lessons"
     And I click to day "Понедельник"
    Then I should see that column "Понедельник" is fatter than other
     And I shouldn't see "yoga" in cell ("Tuesday", 11:30), hall 1
     And I should see "yoga" in cell ("Sunday", 17:30), hall 2
     But I should see "close dance" in cell ("Monday", 11:30), hall 2
     And I should see "close dance" in cell ("Thursday", 20:30), hall 1

  @javascript
  Scenario: Click to specific lesson
    Given Style with preview  "yoga", "yogaga"
      And Coach named "Stek", Style - "yoga"
      And "yoga" lesson at on "Tuesday" at 11:30 in hall 1 coach "Stek"
    When I go to "/lessons"
     And I click to lesson "yoga" on "Tuesday" at 11:30, hall 1
    Then I should see pop up
     And I should see link to coach "Stek" in popup
     And I should see link to style "yoga" in popup
     And I should see description "yogaga" in popup
     And I should see time in popup
     And I should see day in popup
     And I should see hall in popup

  @javascript
  Scenario: Click to no vacancy lesson
    Given Style with preview  "yoga", "yogagoga"
      And Coach named "Steak", Style - "yoga"
      And "yoga" lesson at on "Tuesday" at 11:30 in hall 1 coach "Steak", full
     When I go to "/lessons"
      And I click to lesson "yoga" on "Tuesday" at 11:30, hall 1
     Then I shouldn't see pop up




