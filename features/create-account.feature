#language: en
Feature: Create a new account and be redirected to newsfeed

	As a new user
	So that I can start using the app
	I want to be able to create a new account
	
	Scenario: Create a new user
		Given I am on the home page
		And I Click on "Create An Account"
		Then I should be on the signup page
		And I fill in "First Name" with "New"
		And I fill in "Last Name" with "McNewerson"
		And I fill in "Email" with "test@test.com"
		And I fill in "Password" with "1234"
		And I fill in "Confirm Password" with "1234"
		And I Click on "Submit"
		Then I should be redirected to my profile page
