Given(/^I am on the home page$/) do
  visit root_path
end

Then /^I should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  current_path.should == path_to(page_name)
end

When /^I Click on "(.*)"$/ do |button|
  click_on button
  @current_user = User.find_by_email(@usrEmail)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, :with => value)
  if (field=="Email")
    @usrEmail = value
  end
end

Then /^I should be redirected to (.+)$/ do |page_name|
  current_path.should == path_to(page_name, {"current_user" => @current_user})
end
