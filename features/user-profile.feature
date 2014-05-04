Feature: Users can view profile information on any profile page

	As a user
	So that I can learn a little bit about another user
	I want to be able to see profile information on user profile pages
	
	Scenario Outline:
		Given I am logged in as a user with email "<Email>" and password "<Password>"
		And I am friends with a user with the email "<Friend_Email>"
		And I am on his profile page
		Then I should see "'s Profile"
		And I should see "Email:"
		And I should see "Date of Birth:"
		And I should see "Gender:"
		And I should see "Interests:"
		And I should see "Quotes:"
		And I should see "TV & Movies:"
		And I should see "Music:"
		And I should see their name_first
		And I should see their name_last
		And I should see their email
		And I should see their dob
		And I should see their gender
		And I should see their interests
		And I should see their quotes
		And I should see their tv_and_movies
		And I should see their music

		Examples:
		| Email	                  | Password	|	Friend_Email	|
		| Bob.Ross@colorado.edu   | happytrees	|	billy.jean@colorado.edu		|
		| billy.jean@colorado.edu | aintmyson	|	Bob.ross@colorado.edu	|