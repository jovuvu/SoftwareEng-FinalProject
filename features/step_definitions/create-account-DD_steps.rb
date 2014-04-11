Given(/^I am on the home page$/) do
  visit root_path
end

When /^(?:|I )fill in "(.*?)" with (.*?)$/ do |field, value|
  fill_in(field, :with => value)
end