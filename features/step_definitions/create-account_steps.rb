Given(/^I am on the home page$/) do
  visit root_path
end

Then(/^I should be on (.+)$/) do |page_name|
  current_path = URI.parse(current_url).path
  current_path.should == path_to(page_name)
end

#When(/^I Click on "(Create An Account)"$/) do |button|
#  click_on button
#end

#When(/^I Click on "(Submit)"$/) do |button|
#  click_on button
#  @current_user = User.find_by_email(@usrEmail)
#end


Given(/^My email: "(.+)" is\s?(not)? taken$/) do |email, optional|
  if optional == "not"
    User.find_by_email(email).nil?.should eq(true)
  else
    User.find_by_email(email).nil?.should eq(false)
  end
end

Given(/^My password: "(.+)"\s?(.*)? match my password_confirmation: "(.+)"$/) do |pw, optional, pwC|
  if (optional == "does")
    pw.should eq(pwC)
  elsif (optional == "doesn't")
    pw.should_not eq(pwC)
  end
end
