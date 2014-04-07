Feature: User can login to their account

Scenario: Log In Page Displays
	Given I am on the Login Page
	Then I should see "Login:"
	And I should see "Password:"