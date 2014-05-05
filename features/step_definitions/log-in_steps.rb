Given(/^I am a\s?(new)? user with the email "(.+)" and password "(.+)"$/) do |new, email, password|
  if new.nil?
    @current_user = FactoryGirl.create(:user, email: email, password: password, password_confirmation: password)
  end
end

Given(/^I am on the Login Page$/) do
  visit root_path
end

#Then(/^I should see "(.+)"$/) do |content|
#  page.has_content?(content).should == true
#end

#When(/^I Click on "(Sign In)"$/) do |button|
#  within ".content" do
#    click_on button
#  end
#end

Given /^I've logged in successfully as "(.+)" with password: "(.+)"/ do |email, password|
  many_steps %{
    Given I am a user with the email "#{email}" and password "#{password}"
    And I am on the Login Page
    Then I should see "Email"
    When I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{password}"
    And I Click on "Sign In" within ".content"
    Then I should be redirected to my profile page
  }
end

#When(/^I Click on "(List My Friends)"$/) do |button|
#  click_on button
#end