require 'spec_helper'
require 'capybara'

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

	describe "sign up" do

		before{ visit signup_path }

		let(:submit) {"Sign Up"}

		describe "with valid information" do
			before do
				fill_in "First Name", with: "Rspec"
				fill_in "Last Name", with: "Testperson"
				fill_in "Email", with: "rspec@testperson.com"
				fill_in "Password", with: "password1"
				fill_in "Confirm Password", with: "password1"
			end
			
			it "should create a user" do
		        #expect ( click_button "Sign Up" ).to change(User, :count).by(1)
		    end

		end

		describe "with invalid information" do
			#expect ( click_button "Sign Up" ).not_to change(User, :count)
		end
 
	end

end