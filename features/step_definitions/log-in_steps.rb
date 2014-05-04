Given(/^I am a user with the email "(.+)" and password "(.+)"$/) do |email, password|
  @current_user = FactoryGirl.create(:user, email: email, password: password, password_confirmation: password)
end

Given(/^I am on the Login Page$/) do
  visit root_path
end

Then(/^I should see "(.+)"$/) do |content|
  page.has_content?(content).should == true
end

When(/^I Click on "(Sign In)"$/) do |button|
  within ".content" do
    click_on button
  end
end
