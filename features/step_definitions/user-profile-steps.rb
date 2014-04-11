#BDD Tests for viewing profile page information.
Given (/^the following users exist$/) do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given (/^a user with an email <(.+)>$/) do |email|
  @current_user = User.find_by_email(email)
end

Given (/^I am on their profile page$/) do
  visit('/users/' + @current_user.id.to_s)
end

Then(/^I Should see "(.*?)"$/) do |text|
  page.has_content?(text)
end

Then(/^I should see their (.+)$/) do |preference|
  	page.has_content?(@current_user.instance_eval(preference))
end
