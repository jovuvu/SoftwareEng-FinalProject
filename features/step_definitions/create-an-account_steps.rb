Before do
  @user = User.new
  @inputList = Array.new
end

After do
end

Given (/^I have entered (.+)$/) do |n|
  @inputList.push n
end

# When (/^I press (.+)$/) do |op|
#   #should do some input validation
#   #should check if email already exists before adding
#   #Should call the create user code
#   @user.name_first = @inputList.shift
#   @user.name_last = @inputList.shift
#   @user.email = @inputList.shift
#   @user.password_hash = @inputList.shift
  
#   #Save new user
#   @user.save
# end

Then (/^the new user (.+) should be added to Users$/) do |login|
  #should check if login now exists in Users database
  User.find_by(email: @user.email).should_not == nil
end