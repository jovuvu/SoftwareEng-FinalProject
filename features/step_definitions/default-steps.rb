Given(/^The following users? exists?:$/) do |user|
  user.hashes.each do |user_info|
    @target = User.find_by_email(user_info["email"])
    if(@target.nil?)
      if(user_info.has_key?("password"))
        user_info["password_confirmation"] = user_info["password"]
      end
      new_user = FactoryGirl.create(:user, user_info)
      new_user.should_not eq(nil)
      @target = new_user
    end
  end
end

Given(/^Our default user$/) do
  user_info = {:name_first => "Bob",
              :name_last => "Ross",
              :email => "Bob.Ross@gmail.coom",
              :dob => "05-05-2000",
              :gender => "Male",
              :password => "default",
              :password_confirmation => "default",
              :interests => "painting, trees, happy accidents",
              :quotes => "happy trees",
              :tv_and_movies => "happy feet",
              :music => "death metal" }
  @default_user = FactoryGirl.create(:user, user_info)
end

Given(/^Our default friendship$/) do
  user_info = {:name_first => "Billy",
              :name_last => "Jean",
              :email => "billy.jean@gmail.coom",
              :dob => "05-05-1977",
              :gender => "Male",
              :password => "default",
              :password_confirmation => "default",
              :interests => "making scenes",
              :quotes => "hes the one",
              :tv_and_movies => "all of them",
              :music => "michael jackson" }
  @default_friend = FactoryGirl.create(:user, user_info)
  FactoryGirl.create(:relationship, requesting_user_id: @default_user.id.to_s, receiving_user_id: @default_friend.id.to_s)
end

Given(/^Our default nobody$/) do
  user_info = {:name_first => "Rick",
              :name_last => "James",
              :email => "Rick.James@gmail.coom",
              :dob => "05-05-1966",
              :gender => "Male",
              :password => "default",
              :password_confirmation => "default",
              :interests => "celebrations",
              :quotes => "unity",
              :tv_and_movies => "all of them",
              :music => "Rick James" }
  @default_nobody = FactoryGirl.create(:user, user_info)
end

Given(/^I am logged in as (.+)$/) do |args|
  case args
  when /^"(default_user)"$/
    @current_user = @default_user
    email = @default_user.email
    password = "default"
  when /^"(.+)" with password "(.+)"$/
    email = $1
    password = $2
  when /^"him"$/
    email = @target.email
    password = @target.password
  end
  many_steps %{
    Given I am on the Login Page
    When I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{password}"
    And I Click on "Sign In" within ".content"
    Given Login as "#{email}" was successfull
    Then The current user should be "#{email}"
    And I should be redirected to my profile page
  }
end

Given(/^Friendship to "(.+)" should exist$/) do |friend|
  @current_user.should_not eq(nil)
  case friend
  when /^default_friend$/
    visit path_to("my friends list", {"current_user" => @current_user})
    page.should have_selector("a[href=\"/users/#{@default_friend.id.to_s}\"]")
  else
    @target = User.find_by_email(friend)
    visit path_to("my friends list", {"current_user" => @current_user})
    page.should have_selector("a[href=\"/users/#{@target.id.to_s}\"]")
  end
end

Given(/^I am\s?(.*)? friends with (.+)$/) do |optional, args|
  case args
  when /^"(default_friend)"$/
    @current_friend = @default_friend
    @target = @default_friend
  when /^"him"$/
    if(optional == "")
      FactoryGirl.create(:relationship, requesting_user_id: @current_user.id.to_s, receiving_user_id: @target.id.to_s)
      visit path_to("my friends list", {"current_user"=>@current_user})
      page.all(".friendslist").each do |e1|
        if e1.find("a")["href"] == path_to("profile page for user", {"user"=>@target})
          e1.has_content?("Confirmed").should == true
        end
      end
    end
  end
end

Given(/^I navigate to (.+)$/) do |args|
  case args
  when /^"(his page)"$/
    visit path_to("profile page for user", {"user"=>@target})
  when /^"(my.+)"$/
    visit path_to($1, {"current_user"=>@current_user})
  when /^"([^"]+)"?/
    visit path_to($1)
  end
end

Then(/^I should see (.+)$/) do |attribute|
  content = nil
  case attribute
    when "their name_first"
      content = @current_friend.name_first
    when "their name_last"
      content = @current_friend.name_last
    when "their email"
      content = @current_friend.email
    when "their dob"
      content = @current_friend.dob.strftime('%d-%b-%Y')
    when "their gender"
      content = @current_friend.gender
    when "their interests"
      content = @current_friend.interests
    when "their quotes"
      content = @current_friend.quotes
    when "their tv_and_movies"
      content = @current_friend.tv_and_movies
    when "their music"
      content = @current_friend.music
    when "their wall"
      content = "#{@current_friend.name_first.capitalize}'s Wall"
    when /"(.+)"/
      content = $1
    when /my new (.+)/
      content = $1
    else
      content = attribute
  end
  content.nil?.should eq(false)
  page.has_content?(content).should eq(true)
end

Then(/^The current user should be "(.+)"$/) do |email|
  @current_user = User.find_by_email(email.downcase)
  @current_user.should_not eq(nil)
end

When(/^I Click on (.+)$/) do |args|
  case args
  when /^"([^"]+)"$/
    click_on $1
  when /^"(.+)" within "(.+)"$/
    within $2 do
      click_on $1
    end
  end
end

Then(/^I should be redirected to (.+)$/) do |page_name|
  current_path.should == path_to(page_name, {"current_user" => @current_user})
end

Given(/^Login as "(.+)" was successfull$/) do |email|
  page.has_content?("Sign Out").should eq(true)
  @current_user = User.find_by_email(email.downcase)
  @current_user.should_not eq(nil)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, :with => value)
end