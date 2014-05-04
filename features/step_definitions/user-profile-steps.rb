#BDD Tests for viewing profile page information.
Given(/^I am logged in as a user with email "(.+)" and password "(.+)"$/) do |email, password|
  @current_user=FactoryGirl.create(:user, email: email, password: password, password_confirmation: password)
  step "I am on the Login Page"
  step "I fill in \"Email\" with \"#{email}\""
  step "I fill in \"Password\" with \"#{password}\""
  step "I Click on \"Sign In\""
  step "I should be redirected to my profile page"
end

Given(/^I am friends with a user with the email "(.+)"$/) do |friend_email|
  @current_friend=FactoryGirl.create(:user, email: friend_email)
  FactoryGirl.create(:relationship, requesting_user_id: @current_user.id.to_s, receiving_user_id: @current_friend.id.to_s)
  #Relationship.where(:requesting_user_id => @current_user.id.to_s, :receiving_user_id => @current_friend.id.to_s).nil?.should == false
  visit path_to("my friends list", {"current_user"=>@current_user})
  page.all(".friendslist").each do |e1|
    if e1.find("a")["href"] == path_to("profile page for user", {"user"=>@current_friend})
      e1.has_content?("Confirmed").should == true
    end
  end
end

Given(/^I am on his profile page$/) do
  visit path_to("profile page for user", {"user"=>@current_friend})
  page.has_content?(@current_friend.email.to_s).should == true
end

Then(/^I should see their (.+)$/) do |attribute|
  content = nil
  case attribute
    when "name_first"
      content = @current_friend.name_first
    when "name_last"
      content = @current_friend.name_last
    when "email"
      content = @current_friend.email
    when "dob"
      content = @current_friend.dob.strftime('%d-%b-%Y')
    when "gender"
      content = @current_friend.gender
    when "interests"
      content = @current_friend.interests
    when "quotes"
      content = @current_friend.quotes
    when "tv_and_movies"
      content = @current_friend.tv_and_movies
    when "music"
      content = @current_friend.music
  end
  content.nil?.should eq(false)
  page.has_content?(content).should eq(true)
end