Feature: Users can view profile information on any profile page

	As a user
	So that I can learn a little bit about another user
	I want to be able to see profile information on user profile pages
	Background:
		Given Our default user
		And Our default friendship
		And Our default nobody

	Scenario: View a users profile when you are their friend.
		Given I am logged in as "default_user"
		And I am friends with "default_friend"
		And I navigate to "his page"
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
		
	Scenario: View a users profile when you are NOT their friend.
		Given I am logged in as "default_user"
		And The following user exists:
			|	email					|	name_first	|	password			|
			|	papa.johns@pizza.com	|	papa		|	betterIngredients	|
		And I am NOT friends with "him"
		And I navigate to "his page"
		Then I should see "Only Papa's friends can view their profile"
		And I should see "Send friend request to Papa"
		
	Scenario: View a users profile when you are not logged in.
		Given I am not logged in
		And a user with the email "Poopfeast@gmail.com" and the first name "Poop" exists
		And I am on his profile page
		Then I should see "Only Poop's friends can view their profile"
		And I should see "Send friend request to Poop"
		