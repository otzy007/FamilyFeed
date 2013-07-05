Feature: TODO

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
   And I am on the todo index page
   
Scenario: Add to todo
   When I fill in "todo_text" with "testing the todo"
   And I press "Add to the list"
   Then I should see "testing the todo"
   
Scenario: Delete todo
   Given the following todo items exist:
      |    text    | user_id | post_id | status | family_id | id |
      |  new todo  |    1    |    23   |   new  |     1     | 11 |
   And I am on the todo index page
   Then I should see "new todo"
   When I follow "Delete"
   Then I should not see "new todo"
   
Scenario: Change todo status
   Given the following todo items exist:
      |    text    | user_id | post_id | status | family_id | id |
      |  new todo  |    1    |    23   |   new  |     1     | 11 |
   And I am on the todo index page
   When I check "new"
   And I go to the todo index page
   Then the "new" checkbox should be checked
   
   
   