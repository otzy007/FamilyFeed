Feature: Family admin page

Background: Families and users exist
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
      
      
Scenario: Family creation
   Given I am authenticated as "fara@fam.lie" with password "P@R0l@23"
   When I go to the home page
   Then I should see "You do not belong to any family"
   When I follow "Create your family"
   Then I should see "Family members"
   
Scenario: Add registered user to family
   Given I am authenticated as "mail1@ff.eed" with password "par0l@12"
   And I go to the admin index page
   And I follow "Add member"
   And I fill in "users_email" with "fara@fam.lie"
   And I press "Add User"
   Then I should see "Family members"
   And I should see "fara@fam.lie"
   
Scenario: Cannot add a user that is in another family
   Given I am authenticated as "mail1@ff.eed" with password "par0l@12"
   And I go to the admin index page
   And I follow "Add member"
   And I fill in "users_email" with "sin@gur.el"
   And I press "Add User"
   Then I should see "User singur is already in a family"
   
Scenario: Invite User
   Given I am authenticated as "mail1@ff.eed" with password "par0l@12"
   And I go to the admin index page
   And I follow "Add member"
   And I fill in "users_email" with "new@user.invited"
   And I press "Add User"
   Then a invitation should be be created for "new@user.invited"
   
Scenario: Delete the user from family
   Given I am authenticated as "sin@gur.el" with password "P@R0l@23"
   When I go to the admin index page
   And I follow "Remove User"
   Then I should see "You do not belong to any family"
   