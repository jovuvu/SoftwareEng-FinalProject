#BDD Tests for viewing profile page information.
#Given(/^I am logged in as a user with email "(.+)" and password "(.+)"$/) do |email, password|
#  @current_user=FactoryGirl.create(:user, email: email, password: password, password_confirmation: password)
#  step "I am on the Login Page"
#  step "I fill in \"Email\" with \"#{email}\""
#  step "I fill in \"Password\" with \"#{password}\""
#  step "I Click on \"Sign In\""
#  step "I should be redirected to my profile page"
#end

Given(/^I am not logged in$/) do
  visit root_path
  step "I should see \"Sign In\""
end

Given(/^a user with the email "(.+)" and the first name "(.+)" exists$/) do |email, first|
  @target=FactoryGirl.create(:user, email: email,name_first: first)
end

Given(/^I am on his profile page$/) do
  visit path_to("profile page for user", {"user"=>@target})
  current_path.should == path_to("profile page for user", {"user"=>@target})
end

