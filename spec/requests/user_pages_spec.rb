require 'spec_helper'

describe "User pages" do
	
	subject { page }

	describe "signup page" do


		before { visit "/" }

		it { should have_content('Sign up') }
		it { should have_title('Software Engineering Final Project')}

	end

	describe "profile page" do

		# use Factory Girl gem to create a user (factory)
		let(:user) { FactoryGirl.create(:user)}

		before { visit user_path(:user) }

		it { should have_content(:user.name_first + :user.name_last) }
		it { should have_title(:user.name_first + :user.name_last)}


	end

end