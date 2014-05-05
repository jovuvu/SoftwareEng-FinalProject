Feature: Edit profile preferences and be redirected to the profile page.

	As a user
	So that I can have my profile match with my current interests and information
	I want to be able to edit my profile preferences
	
	Background:
		Given The following users exist:
			|	email					|	password	|
			|	Bob.Ross@colorado.edu	|	happytrees	|	
			|	billy.jean@colorado.edu	|	makeascene	|

		
	Scenario Outline: Changing my own profile
		Given I am logged in as "<email>" with password "<password>" 
		And I navigate to "my profile preferences"
		And I Entered my dob: <dob>
		And I Entered my gender: <gender>
		And I entered my interests: <interests>
		And I entered my quotes: <quotes>
		And I entered my tv_and_movies: <tv_and_movies>
		And I entered my music: <music>
		And I Click on "Save Changes"
		Then I should be redirected to my profile page
		And I Should see my new <dob>
		And I Should see my new <gender>
		And I should see my new <interests>
		And I should see my new <quotes>
		And I should see my new <tv_and_movies>
		And I should see my new <music>

		Examples:
		| email	                  | password	|	dob	       	| gender | interests | quotes	       | tv_and_movies	  | music	            |
		| Bob.Ross@colorado.edu   | happytrees	|	1991-May-08 | Male   | Puppies   | Puppies are cute | Game of Puppies  | The Rolling Puppies |
		| billy.jean@colorado.edu | makeascene	|	1992-Mar-25 | Female | Kittens   | Kittens are nice | Breaking Kittens | Guns and Kittens    |
