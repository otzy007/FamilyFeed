Given /^the event "([^\"]*)" with "([^\"]*)" exist$/ do |title, content|
   step "I am on the new calendar page"
   step %{I fill in "calendar_title" with "#{title}"}
   step %{I fill in "calendar_text" with "#{content}"}
   step %{I press "Save"}
   step %{I should see "#{title}"}
end