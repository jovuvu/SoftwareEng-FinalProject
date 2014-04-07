Feature: User can view their profile

Scenario: Profile Page Displays
	Given I am on the user profile page
	Then I should see "Email:"
	Then I should see "Date of Birth:"
	Then I should see "Gender:"
	Then I should see "Interests:"
	Then I should see "Quotes:"
	Then I should see "TV and Movies:"
	Then I should see "Music:"
	If I follow "Edit"
	Then I should be on the edit profile page
	If I follow "Back"
	Then I should be on the listing users page