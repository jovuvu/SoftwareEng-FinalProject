#language: en
Feature: Create a new account and be redirected to newsfeed

	As a new user
	So that I can start using the app
	I want to be able to create a new account
	
	Scenario Outline: Create a new user
		Given I have entered <First_Name>
		And I have entered <Last_Name>
		And I have entered <Email>
		And I have entered <Password>
		When I press <Create_Account>
		Then the new user <Email> should be added to Users
	
		Examples:
		| First_Name 	|	Last_Name	|	Email			|	Password	|
		| Billy			|	Bob			|	blah@gmail.com	|	1234		|
		| Chris			|	Christy		|	CChris@gmail.com|	5678		|