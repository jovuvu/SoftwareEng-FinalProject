#language: en
Feature: Create a new account and be redirected to newsfeed

	As a new user
	So that I can start using the app
	I want to be able to create a new account
	
	Scenario: Create a new user
		Given I am on the home page
		And I fill in "First Name" with "New"
		And I fill in "Last Name" with "McNewerson"
		And I fill in "Email" with "test@test.com"
		And I fill in "Password" with "1234"
		And I press "Sign Up"
		Then I should be redirected to my profile page
