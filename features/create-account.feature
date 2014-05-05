#language: en
Feature: Create a new account and be redirected to newsfeed

	As a new user
	So that I can start using the app
	I want to be able to create a new account
	
	Background:
		Given The following user exists:
		|	email					|	name_first	|	name_last	|
		|	charliemurphy@gmail.com	|	charlie		|	murphy		|
	
	Scenario Outline: Create a new user
		Given I am on the home page
		And I Click on "Create An Account"
		Then I should be on the signup page
		And I fill in "First Name" with "<name_first>"
		And I fill in "Last Name" with "<name_last>"
		And I fill in "Email" with "<email>"
		And I fill in "Password" with "<password>"
		And I fill in "Confirm Password" with "<password_confirmation>"
		Given My email: "<email>" is not taken
		And My password: "<password>" does match my password_confirmation: "<password_confirmation>"
		And I Click on "Submit"
		Then The current user should be "<email>"
		And I should be redirected to my profile page
		
		Examples:
		| email	                |		name_first		|		name_last		|		password		|		password_confirmation		|
		| bob.ross@gmail.com  	|		bob				|		ross			|		happytrees		|		happytrees					|
		
	
	Scenario Outline: Create a new user whose email already exists
		Given I am on the home page
		And I Click on "Create An Account"
		Then I should be on the signup page
		And I fill in "First Name" with "<name_first>"
		And I fill in "Last Name" with "<name_last>"
		And I fill in "Email" with "<email>"
		And I fill in "Password" with "<password>"
		And I fill in "Confirm Password" with "<password_confirmation>"
		Given My email: "<email>" is taken
		And My password: "<password>" does match my password_confirmation: "<password_confirmation>"
		And I Click on "Submit"
		Then I should be redirected to the signup page
		And I should see "Email: Has Already Been Taken"
		
		Examples:
		| email	                	|		name_first		|		name_last		|		password		|		password_confirmation		|
		| charliemurphy@gmail.com  	|		Rick			|		James			|		unity			|		unity						|
	
	Scenario Outline: Create a new user whose passwords do not match
		Given I am on the home page
		And I Click on "Create An Account"
		Then I should be on the signup page
		And I fill in "First Name" with "<name_first>"
		And I fill in "Last Name" with "<name_last>"
		And I fill in "Email" with "<email>"
		And I fill in "Password" with "<password>"
		And I fill in "Confirm Password" with "<password_confirmation>"
		Given My email: "<email>" is not taken
		And My password: "<password>" doesn't match my password_confirmation: "<password_confirmation>"
		And I Click on "Submit"
		Then I should be redirected to the signup page
		And I should see "Confirm Password: Doesn't Match Password"
		
		Examples:
		| email	                	|		name_first		|		name_last		|		password		|		password_confirmation		|
		| derpydoodah@gmail.com  	|		derpy			|		doo				|		dah				|		hodor						|
		