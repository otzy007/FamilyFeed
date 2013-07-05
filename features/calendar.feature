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