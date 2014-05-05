Feature: User can login to their account

	As a user
	So that I can use the app
	I want to be able to login
	Background:
		Given Our default user
		And Our default friendship
		And Our default nobody
		Given The following user exists:
			|	email					|	password	|
			|	Bob.Ross@colorado.edu	|	happytrees	|

	Scenario: Valid user login
		And I am on the Login Page
		When I fill in "Email" with "Bob.Ross@colorado.edu"
		And I fill in "Password" with "happytrees"
		And I Click on "Sign In" within ".content"
		Given Login as "Bob.Ross@colorado.edu" was successfull
		Then I should be redirected to my profile page
		
	Scenario: Invalid user login
		And I am on the Login Page
		When I fill in "Email" with "Bob.Ross@colorado.edu"
		And I fill in "Password" with "happylittleaccidents"
		And I Click on "Sign In" within ".content"
		Then I should see "Invalid email/password combination"
		
	Scenario: Login and view my friends
		Given I am logged in as "default_user"
		When I Click on "List My Friends"
		Then I should see "Listing User's Relationships"