Feature: Scheduling and Task Management

  User can schedule and manage tasks


  Scenario: Regular user adding the To-Do list
    GIVEN that I am a regular user
	WHEN I add a new item to the To-Do list
	THEN I should be able to see my To-Do list updated with the new item


  Scenario: Administrator adding and sharing the To-Do list
    GIVEN that I am an administrator
	WHEN I add a new item to the To-Do list
	AND mark “share” for that item
	THEN everyone at that group should be able to see the item