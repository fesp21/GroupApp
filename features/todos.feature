Feature: Todo List

  User can add, delete, edit, mark finish, and mark unfinished todos in groups that they belong in
	
  Scenario: User deleting a todo
	Given that I am a user
	When I click the "todos" link for the group
	Then I should be able to delete the todo


  Scenario: User adding a todo
    Given that I am a user
	When I add a new todo with description "Milestone"
	Then I should see "Milestone" in the group's todos page
	
	
  Scenario: User editing a todo
	Given that I am a user
	When I try to edit a todo named "Milestone"
	Then I should see the edit page for "Milestone"


  Scenario: User marking a todo finished
	Given that I am a user
	When I mark a todo finished
	Then I should see the todo marked as finished
	
	
  Scenario: User marking a todo unfinished
	Given that I am a user
	When I mark a todo unfinished
	Then I should see the todo marked as unfinished