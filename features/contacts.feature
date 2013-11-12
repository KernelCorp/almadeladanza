Feature: Contacts Page

  Scenario: show page
    Given contact email - 'contact@m.e'
      And address - 'Pirogova 2'
      And contact phone - '89136663311'
    When I go to "/contacts"
    Then I should see yandex map
     And I should see "contact@m.e"
     And I should see "Pirogova 2"
     And I should see "89136663311"

  Scenario: manage contacts
    Given I sign in as admin
    When I go to "/admin/contacts/edit"
    Then I should see input for "email"
     And I should see input for "address"
     And I should see input for "phone"
