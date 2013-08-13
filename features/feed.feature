Feature: Feed

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
   And I am on the home page
   
Scenario: Add a post
   When I fill in "feed_post" with "test post"
   And I press "Post"
   Then I should see "test post"
   
Scenario: Add a checkin
   When I check "feed_checkin"
  # And I share my location and it returns "41.8954656,12.4823243"
   And I fill in "feed_post" with "test checkin"
   And I press "Post"
   Then I should see "test checkin"
  # And I should see "near"
   
Scenario: Comment post
   When I fill in "feed_post" with "post"
   And I press "Post"
   And I follow "Comment"
   And I fill in "feed_comment" with "le comment"
   Then I should see "le comment"