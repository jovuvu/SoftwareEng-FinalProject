#BDD Tests for editing profile preferences.
Given(/^I Entered my dob: (\d+)\-(\w+)\-(\d+)$/) do |year, month, day|
  @months = {"Jan" => "01", "Feb" => "02", "Mar" => "03", "Apr" => "04", "May" => "05", 
  "Jun" => "06", "Jul" => "07", "Aug" => "08", "Sep" => "09", "Oct" => "10", "Nov" => "11", "Dec" => "12"}
  select(@months[month], from: 'user_dob_2i')
  select(day, from: 'user_dob_3i')
  select(year, from: 'user_dob_1i')
end

Given(/^I Entered my gender: (Male|Female)$/) do |gender|
  select(gender, from: 'user_gender')
end

Given(/^I entered my (.+): (.+)$/) do |id, value|
	fill_in('user_' + id, with: value)
end

#When(/^I Click on (Save Changes)$/) do |button|
#  click_on button
#end

Then(/^I Should see my new (\d+)\-(\w+)\-(\d+)$/) do |year, month, day|
  page.has_content?(month).should eq(true)
  page.has_content?(day).should eq(true)
  page.has_content?(year).should eq(true)
end

Then(/^I Should see my new (Male|Female)$/) do |gender|
  page.has_content?(gender).should eq(true)
end


