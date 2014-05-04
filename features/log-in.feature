Feature: User can login to their account

	As a user
	So that I can use the app
	I want to be able to login

	Scenario Outline: Valid user login
		Given I am a user with the email "<Email>" and password "<Password>"
		And I am on the Login Page
		Then I should see "Email"
		When I fill in "Email" with "<Email>"
		And I fill in "Password" with "<Password>"
		And I Click on "Sign In"
		Then I should be redirected to my profile page
		
		Examples:
		| Email	                  | Password	|
		| Bob.Ross@colorado.edu   | happytrees	|
		| billy.jean@colorado.edu | aintmyson	|
		
	Scenario Outline: Invalid user login
		Given I am a new user with the email "<Email>" and password "<Password>"
		And I am on the Login Page
		Then I should see "Email"
		When I fill in "Email" with "<Email>"
		And I fill in "Password" with "<Password>"
		And I Click on "Sign In"
		Then I should see "Invalid email/password combination"
		
		Examples:
		| Email	                  | Password	|
		| Bob.Ross@colorado.edu   | happytrees	|
		| billy.jean@colorado.edu | aintmyson	|