Given(/^the following todo items exist:$/) do |table|
   table.hashes.each do |t|
      Todo.create! t
   end
end