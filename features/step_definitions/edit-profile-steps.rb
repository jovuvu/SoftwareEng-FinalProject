#BDD Tests for editing profile preferences.

Given (/^I am a user with the email (.+)$/) do |email|
	@current_user = User.find_by_email(email)
end

Given(/^I navigate to the profile preferences$/) do
	visit('/users/' + @current_user.id.to_s + '/edit')
end

Given(/^I Entered my dob: (\d+)\-(\d+)\-(\d+)$/) do |year, month, day|
  select(month, from: 'user_dob_2i')
  select(day, from: 'user_dob_3i')
  select(year, from: 'user_dob_1i')
end

Given(/^I Entered my gender: (Male|Female)$/) do |gender|
  select(gender, from: 'user_gender')
end

Given(/^I entered my (.+): (.+)$/) do |id, value|
	fill_in('user_' + id, with: value)
end

Given(/^I clicked the button (.+)$/) do |value|
	click_button(value)
end

#Then(/^I should be redirected to my profile page$/) do
#  expect(current_path).to eq('/users/' + @current_user.id.to_s)
#end

Then(/^I Should see my new (\d+)\-(\d+)\-(\d+)$/) do |year, month, day|
  page.has_content?(month)
  page.has_content?(day)
  page.has_content?(year)
end

Then(/^I Should see my new (Male|Female)$/) do |gender|
  page.has_content?(gender)
end

Then(/^I should see my new (.+)$/) do |value|
  page.has_content?(value)
end

