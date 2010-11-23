Feature: User Permissions Management

  Administrator can manage user permissions
  Administrators can remove users from their group
  Normal users cannot manage user permissions
  Normal users cannot remvoe users from their group

  Scenario: Administrator changing access level
    Given that I am an administrator in a group
	When I try to change someones access level
	Then I should be able to change it
	
  Scenario: Administrator removing user from group
    Given that I am an administrator in a group
	When I try to remove a user
	Then I should be able to remove them
	
  Scenario: Regular member trying to change access level
    Given that I am regular member in a group
	When I try to change someones access level
	Then it will not allow me to change their level

  Scenario: Regular member trying to remove user from their group
    Given that I am regular member in a group
	When I try to remove a user
	Then it will not allow me to remove them