Given /^the following families exist:$/ do | families_table |
   families_table.hashes.each do |u|
      Family.create! u
   end
end

Given /^the following users exist:$/ do | users_table |
   users_table.hashes.each do |u|
      User.create! u
   end
end