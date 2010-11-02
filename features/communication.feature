Feature: User Communication
In order to communicate
As a user
I want to be able to use posts and comments
  
  Scenario: Administrator deleting bad post
    Given that I am an administrator
	When I see a bad post
	Then I should be able to delete it


  Scenario: User posting a message
	Given that I am a post user
	When I post a message
	Then I should be able to see it on the post page
	
	
  Scenario: User posts a comment on a post
	Given that I am a post user
	When I see a post
	Then I should be able to comment on it