Given /^that I am a user$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id)
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I click on "([^"]*)" for "([^"]*)" on the uploads page$/ do |arg1, arg2|
  @file = Upload.create!(:filename => "a.pdf", :description => "a file", :group_id => @group.id)
  visit group_uploads_url(@group.id)
end

Then /^I should be prompted to download the file$/ do
  response.should contain("Download")
end

Then /^I should be prompted to destroy the file$/ do
  response.should contain("Destroy")
end

When /^I add a file named "([^"]*)"$/ do |arg1|
  @file = Upload.create!(:filename => "a.pdf", :description => "a file", :group_id => @group.id)
end

Then /^I should see "([^"]*)" in the index upload page$/ do |arg1|
	visit group_uploads_url(@group.id)
	assert_contain "a.pdf"
end

When /^I try to edit a file named "([^"]*)"$/ do |arg1|
  @file = Upload.create!(:filename => "a.pdf", :description => "a file", :group_id => @group.id)
  visit group_uploads_url(@group.id)
  click_link "Edit"
end

Then /^I should be in the edit page for "([^"]*)"$/ do |arg1|
  response.should contain("edit")
end

When /^I try to download a file named "([^"]*)" to a group that I am not in$/ do |arg1|
  @group = Group.create!(:name => "GroupName2", :description => "description2")
  @file = Upload.create!(:filename => "a.pdf", :description => "a file", :group_id => @group.id)
  visit group_uploads_url(@group.id)
end

When /^I try to delete a file named "([^"]*)" to a group that I am not in$/ do |arg1|
  @group = Group.create!(:name => "GroupName2", :description => "description2")
  @file = Upload.create!(:filename => "a.pdf", :description => "a file", :group_id => @group.id)
  visit group_uploads_url(@group.id)
end

When /^I try to add a file named "([^"]*)" to a group that I am not in$/ do |arg1|
  @group = Group.create!(:name => "GroupName2", :description => "description2")
  @file = Upload.create!(:filename => "a.pdf", :description => "a file", :group_id => @group.id)
  visit group_uploads_url(@group.id)
end

When /^I try to edit a file named "([^"]*)" in a group that I am not in$/ do |arg1|
  @group = Group.create!(:name => "GroupName2", :description => "description2")
  @file = Upload.create!(:filename => "a.pdf", :description => "a file", :group_id => @group.id)
  visit group_uploads_url(@group.id)
end

Then /^I should not be on the download page$/ do
	response.should_not contain("Download")
end
