require 'spec_helper'

describe User do
  
  before do
  	@user = User.new(name_first: "Rspec", name_last: "Testuser", email: "testuser@rspec.com")
  end
  subject { @user }

  it { should respond_to(:name_first) }
  it { should respond_to(:name_last) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name_first is not present" do
  	# test checks to see that an invalid first name is caught
  	before { @user.name_first = " "}
  	it { should_not be_valid }
  end
end