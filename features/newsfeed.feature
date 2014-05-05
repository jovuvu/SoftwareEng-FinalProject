Feature: Show a users newsfeed that contains all wall posts with the friends' wall posts

	As a user
	So that I can stay up to date with the goings on of other people's lives
	I want to be able to have a newsfeed that displays all my posts and my friends' posts
	
	Background:
		Given Our default user
		And Our default friendship
		And Our default nobody

	Scenario: Test default conditions
		Given I am logged in as "default_user"
		Then Friendship to "default_friend" should exist
		
	Scenario: View a users profile when you are their friend.
		Given I am logged in as "default_user"
		And I am friends with "default_friend"
		And I navigate to "his page"
		Then I should see their wall