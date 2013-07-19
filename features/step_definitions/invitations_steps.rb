Given(/^"(.*?)" is invited by "(.*?)" with token "(.*?)"$/) do |to, by, token|
   i = User.find_by_email(by).family.invites.new email: to
   i.token = token
   i.save!
end
