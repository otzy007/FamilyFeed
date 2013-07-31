Given /^I am not authenticated$/ do
  delete('/users/sign_out') # ensure that at least
end

Given /^I am authenticated as "([^\"]*)" with password "([^\"]*)"$/ do | email, password |
   visit '/users/sign_in'
   fill_in('user_email', :with => email)
   fill_in('user_password', :with => password)
   click_button 'Sign in'
end
When /^I sign in with "([^\"]*)" and password "([^\"]*)"$/ do | email, password |
   fill_in('user_email', :with => email)
   fill_in('user_password', :with => password)
   click_button 'Sign in'
end