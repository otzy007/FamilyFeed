Feature: First page - login

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
   

Scenario: User login
   Given I go to the home page
   Then I should see "You need to sign in or sign up before continuing."
   When I sign in with "mail1@ff.eed" and password "par0l@12"
   Then I should be on the home page
   And I should see "Signed in successfully."
   
Scenario: User registration
   When I go to register
   And I fill in "user_email" with "alt@em.ail"
   And I fill in "user_name" with "cineva"
   And I fill in "user_password" with "0paro!@lunga"
   And I fill in "user_password_confirmation" with "0paro!@lunga"
   And I press "Sign up"
   Then I should see "You have signed up successfully"