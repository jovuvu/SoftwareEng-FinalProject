Given(/^I am a\s?(new)? user with the email "(.+)" and password "(.+)"$/) do |new, email, password|
  if new.nil?
    @current_user = FactoryGirl.create(:user, email: email, password: password, password_confirmation: password)
  end
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
