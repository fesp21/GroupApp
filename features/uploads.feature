Feature: Resources Management

  User can store, download, edit, and delete files in groups that they belong in
  User cannot store, download, edit, and delete files in groups that they do not belong in

  
  Scenario: User downloading a file
	Given that I am a user
	When I click on "Download" for "a.pdf" on the uploads page
	Then I should be prompted to download the file

	
  Scenario: User deleting a file
	Given that I am a user
	When I click on "Destroy" for "a.pdf" on the uploads page
	Then I should be prompted to destroy the file


  Scenario: User adding a file
    Given that I am a user
	When I add a file named "a.pdf"
	Then I should see "a.pdf" in the index upload page
	
	
  Scenario: User editing a file
	Given that I am a user
	When I try to edit a file named "a.pdf"
	Then I should be in the edit page for "a.pdf"
	
	
  Scenario: User failing to download a file from a group they are not in
    Given that I am a user
	When I try to download a file named "a.pdf" to a group that I am not in
	Then I should not be on the download page
	
	
  Scenario: User failing to delete a file from a group they are not in
    Given that I am a user
	When I try to delete a file named "a.pdf" to a group that I am not in
	Then I should not be on the download page
	
	
  Scenario: User failing to add a file from a group they are not in
    Given that I am a user
	When I try to add a file named "a.pdf" to a group that I am not in
	Then I should not be on the download page
	
	
  Scenario: User failing to edit a file from a group that they are not in
	Given that I am a user
	When I try to edit a file named "a.pdf" in a group that I am not in
	Then I should not be on the download page