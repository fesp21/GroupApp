Feature: Todo List

  User can add, delete, edit, mark finish, and mark unfinished todos in groups that they belong in
	
  Scenario: User deleting a todo
	Given that I am a user
	When I click the todos link for the group
	And create a todo list
	Then I should be able to delete the todo


  Scenario: User adding a todo
    Given that I am a user
	When I click the todos link for the group
	And create a todo list
	Then I should see the todo list in the groups todos page
	
	
  Scenario: User editing a todo
	Given that I am a user
	When I click the todos link for the group
	And create a todo list
	And I try to edit the todo list
	Then I should see the edit page


  Scenario: User marking a todo finished
	Given that I am a user
	When I click the todos link for the group
	And create a todo list
	And I mark a todo finished
	Then I should see the todo marked as finished
	
	
  Scenario: User marking a todo unfinished
	Given that I am a user
	When I click the todos link for the group
	And create a todo list
	And I mark a todo finished
	And I mark a todo unfinished
	Then I should see the todo marked as unfinished