require 'spec_helper'

describe User do
  
  before do
  	@user = User.new(name_first: "Rspec", name_last: "Testuser", email: "testuser@rspec.com", 
  		password: "password", password_confirmation: "password")
  end

  subject { @user }

  it { should respond_to(:name_first) }
  it { should respond_to(:name_last) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

# PRESENCE TESTS
  describe "when name_first is not present" do
  	# test checks to see that a blank first name is caught
  	before { @user.name_first = " "}
  	it { should_not be_valid }
  end

  describe "when name_last is not present" do
  	# test checks to see that a blank last name is caught
  	before { @user.name_last = " "}
  	it { should_not be_valid }
  end 

  describe "when email is not present" do
  	# test checks to see that a blank email is caught
  	before { @user.email = " "}
  	it { should_not be_valid }
  end

  describe "when password is not present" do
  	# test checks to see that a blank password is caught
  	before do
  		@user = User.new(name_first: "Rspec", name_last: "Testuser", email: "testuser@rspec.com", 
  		password: " ", password_confirmation: " ")
  	end  

  	it { should_not be_valid }
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

# LENGTH TESTS
  describe "when name_first is too long" do
  	# test checks length of name_first
  	before {@user.name_first = "a" * 51}
  	it { should_not be_valid }
  end

  describe "when name_last is too long" do
  	# test checks length of name_last
  	before {@user.name_last = "a" * 51}
  	it { should_not be_valid }
  end

# FORMAT VALIDATION TESTS
 	describe "when email format is invalid" do
 		it "should be invalid" do
 			addresses = %w[user@foo,com user_at_foo.org user@foo.org.
 				foo@bar_baz.com foo@bar+baz.com]
 			addresses.each do |invalid_address|
 				@user.email = invalid_address
 				expect(@user).not_to be_valid
 			end
 		end
  	end

  	describe "when email format is valid" do
 		it "should be valid" do
 			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
 			addresses.each do |valid_address|
 				@user.email = valid_address
 				expect(@user).to be_valid
 			end
 		end
  	end

# UNIQUENESS VALIDATION TESTS
	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid}
	end

# PASSWORD VALIDATION TESTS
	describe "when password and password_confirmation don't match" do
		# makes sure the password and the password_confirmation match
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "return value of the authenticate method" do
		# save user to db to be retrieved with 'find_by'
		before { @user.save }
		# find user with find_by
		# let creates local variables inside tests
		let(:found_user) { User.find_by(email: @user.email) }

		# @user and :found_user passwords match
		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end 

		# @user and :found_user passwords don't match
		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid")}
			
			it { should_not eq user_for_invalid_password}
			# specify is synonym for 'it' method
			specify { expect(user_for_invalid_password).to be_false }
		end
	end

	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a" * 7}
		it { should be_invalid }
	end
end