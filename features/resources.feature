Feature: Resources Management

  User can store,download, and delete files

  
  Scenario: User downloading a file
	Given that I am a user
	When I click on "Download" for "a.pdf" on the uploads page
	Then I should be prompted to download the file

	
  Scenario: User deleting a file
	Given that I am a user
	When I click on "Destroy" for "a.pdf" on the uploads page
	Then I should be prompted to destroy the file


  Scenario: User adding a file
	Given a file named "a.pdf"
	When I go to the new upload page
	And selected the file to upload
	Then I should see "a.pdf" in the index upload page
	