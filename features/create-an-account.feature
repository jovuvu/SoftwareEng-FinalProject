#language: en
Feature: Create a new account and be redirected to newsfeed

	As a new user
	So that I can start using the app
	I want to be able to create a new account

	Scenario Outline: Redirect user to profile
		Given I am on the home page
		And I fill in "First Name" with <First_Name>
		And I fill in "Last Name" with <Last_Name>
		And I fill in "Email" with <Email>
		And I fill in "Password" with <Password>
		Then I press "Sign Up"
		And I should be on the user profile page

		Examples:
		| First_Name 	|	Last_Name	|	Email			|	Password	|
		| Billy			|	Bob			|	blah@gmail.com	|	1234		|
		| Chris			|	Christy		|	CChris@gmail.com|	5678		|