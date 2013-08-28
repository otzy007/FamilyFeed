Feature: Calendar

Background: Families and users exist and I am logged in
   Given the following families exist:
      | id |  name  |
      |  1 |  fam1  |
      |  2 |  fam2  |
      
   And the following users exist:
      |    email     |    name    | password | family_id |
      | mail1@ff.eed |    tata    | par0l@12 |     1     |
      | m2@ff.eed    |    mama    | P@r0la32 |     1     |
      | sin@gur.el   |   singur   | P@R0l@23 |     2     |
      | fara@fam.lie |   farafam  | P@R0l@23 |           |
      
   And I am authenticated as "mail1@ff.eed" with password "par0l@12"
   And I am on the calendar index page
   
Scenario: Add event
   When I follow "New Event"
   And I fill in "calendar_title" with "Marele eveniment"
   And I fill in "calendar_text" with "Continut"
   And I press "Save"
   Then I should see "Marele eveniment"
   
Scenario: Show event
   Given the event "Alt eveniment" with "Nimic important" exist
   Then I should see "Alt eveniment"
   When I follow "Alt eveniment"
   Then I should see "Nimic important"
   
Scenario: Delete event
   Given the event "Alt eveniment" with "Nimic important" exist
   When I follow "Alt eveniment"
   And I follow "Delete"
   Then I should see "New Event"
   And I should not see "Alt eveniment"
   
Scenario: Modify event name
   Given the event "Alt eveniment" with "Nimic important" exist
   When I follow "Alt eveniment"
   And I follow "Edit"
   And I fill in "calendar_title" with "Marele eveniment"
   And I press "Save"
   Then I should see "Marele eveniment"
   
Scenario: Create event comment
   Given the event "Alt eveniment" with "Nimic important" exist
   When I follow "Alt eveniment"
   And I fill in "feed_comment" with "Un comentariu"
   And I press "Comment"
   Then I should see "Un comentariu"