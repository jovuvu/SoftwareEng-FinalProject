Feature: The user can post anything on his wall for other users to comment about

	As a user
	So that I can show people how awesome I am
	I want to be able to post messages on my wall
	
	Background:
		Given Our default user
		And Our default friendship
		And Our default nobody
		
	Scenario: Post something new when logged in
		Given I am logged in as "default_user"
		And I Click on "New Post"
		Then I should see "Post a Message"
		When I fill in "post_content" with "I love painting because im bob ross"
		And I Click on "Save Post"
		Then I should see "I love painting because im bob ross"