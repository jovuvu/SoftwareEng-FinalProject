require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign In') }
    it { should have_title('Sign In') }
  end

   describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign In" }

      it { should have_title('Sign In') }
      it { should have_selector('div#error.message') }

      describe "after visiting another page" do
      	before { click_link "User List" }
      	it { should_not have_selector('div#error.message')}
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign In"
      end

      it { should have_link('Sign Out',    href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }

      describe "followed by signout" do
          before { click_link "Sign Out" }
          it { should have_link('Sign In') }
      end
    end
  end

  	# custom rspec test for signing in through the homepage
  	describe "sign in from homepage" do
  		before { visit root_path }

  		describe "with invalid information" do
  			before { click_button "Sign In" }

		    # it { should have_title('Sign in') }
		    it { should have_selector('div#error.message') }
  		end
	end
end
