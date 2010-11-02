Feature: Upload

  Users can upload/delete/download a file to/from the group

  Scenario: User adds "a.pdf"
    GIVEN that I'm a user
    WHEN I click on "Create" in the new upload page
	And Gid is "a"
	And Filename is "a.pdf"
	And the user selected a file from their computer
    THEN I should see the file in the index page

  Scenario: User deletes "a.pdf"
    GIVEN that I'm a user
	AND a file "a.pdf" exists in the upload index page
    WHEN I click on "Destroy" for "a.pdf" in the upload index page
    THEN the file should be removed from the upload index page

  Scenario: User downloads "a.pdf"
    GIVEN that I'm a user
	AND a file "a.pdf" exists in the upload index page
    WHEN I click on "Download" for "a.pdf" in the upload index page
    THEN I should be linked to the file