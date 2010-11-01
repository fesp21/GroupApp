Feature: Resources Management

  User can store and download files


  Scenario: User uploading a file
    GIVEN that I have permissions to add to the resources page
	WHEN I select a file locally
	AND click the “upload” button
	THEN I should be able to see the file on the resources page


  Scenario: User deleting a file
	GIVEN that I have permissions to modify a file
	WHEN I select the file on the resources page
	AND click the “delete” button
	THEN it should not appear on the resources page after the click


  Scenario: User downloading a file
	GIVEN that I am a user
	WHEN I click on a specific file on the resources page
	AND click the “download” button
	THEN I should be prompted to download the file


  Scenario: User renaming a file
	GIVEN that I have permissions to modify a given file
	WHEN I select the file on the resources page
	AND click the “Rename” button
	AND input a new name for the file
	THEN I should see the file on the resources page under the new name
	AND NOT see the file on the resources page under the old name


  Scenario: User granting permission to modify a file
	GIVEN that I have admin privileges for a resource
	WHEN I select the resource
	AND click the “change permissions” button
	AND select another user to grant permissions to “modify” the resource
	THEN the user should see his permissions as “modify”
	