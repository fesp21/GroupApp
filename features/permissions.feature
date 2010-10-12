Feature: User Permissions Management

  User can manage user permissions


  Scenario: Administrator changing access level
    GIVEN that I am an administrator
	WHEN I want to change someone’s access level
	THEN I should be able to change it


  Scenario: Regular member try to change access level
    GIVEN that I am regular member
	WHEN I try to change someone’s access level
	THEN it will not allow me