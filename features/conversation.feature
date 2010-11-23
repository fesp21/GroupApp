Feature: User Conversation
In order to communicate with other users
As a user
I want to be able to write messages to other users
  
  Scenario: User posting a message
	Given that I am a user
	When I write a message to another user
	Then I should be able to see it on my home page

  Scenario: User deleting a message that he/she wrote
    Given that I am a user
	When I see a message that I wrote
	Then I should be able to delete it
	
  Scenario: User deleting a message that someone else wrote to him/her
    Given that I am a user
	When I see a message that someone wrote to me
	Then I should be able to delete it
