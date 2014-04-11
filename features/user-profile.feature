Feature: Users can view profile information on any profile page

	As a user
	So that I can learn a little bit about another user
	And so that I can identify friends easier
	I want to be able to see profile information on user profile pages

	Background: users have been added to the database

		Given the following users exist
		| name_first | name_last | email                        | dob        | gender | password_hash | interests | quotes | tv_and_movies | music |
		| Diego      | Escalante | diego.escalante@colorado.edu | 8-May-1991 | male   | pass1		  | Lions     | Tigers | Bears         | OhMy  |

	Scenario: Profile Page Displays
		Given a user with an email <diego.escalante@colorado.edu>
		And I am on their profile page
		Then I Should see "'s Profile"
		And I Should see "Email:"
		And I Should see "Date of Birth:"
		And I Should see "Gender:"
		And I Should see "Interests:"
		And I Should see "Quotes:"
		And I Should see "TV and Movies:"
		And I Should see "Music:"
		And I should see their name_first
		And I should see their name_last
		And I should see their email
		And I should see their dob
		And I should see their gender
		And I should see their interests
		And I should see their quotes
		And I should see their tv_and_movies
		And I should see their music