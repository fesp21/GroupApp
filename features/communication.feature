Feature: User Communication

  User can communicate with each other

  
  Scenario: Administrator deleting bad post
    GIVEN that I am an administrator
	WHEN I see a bad post
	THEN I should be able to delete it


  Scenario: User posting a message
	GIVEN that I am a user
	WHEN I post a message
	THEN I should be able to see it in the group home page