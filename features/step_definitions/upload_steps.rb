Given /^that I am a user$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I click on "([^"]*)" for "([^"]*)" on the uploads page$/ do |arg1, arg2|
  @file = Upload.create!(:gid => "1", :filename => "a.pdf", :description => "a file")
  @file = Upload.create!(:gid => "2", :filename => "a2.pdf", :description => "a file 2")
  visit uploads_url
  click_link "Destroy"
end

Then /^I should be prompted to download the file$/ do
  response.should contain("Download")
end

Then /^I should be prompted to destroy the file$/ do
  response.should contain("Destroy")
end

Given /^a file named "([^"]*)"$/ do |arg1|
  @file = Upload.create!(:gid => "1", :filename => "a.pdf", :description => "a file")
end

When /^selected the file to upload$/ do
  @file = Upload.create!(:gid => "1", :filename => "a.pdf", :description => "a file")
end

Then /^I should see "([^"]*)" in the index upload page$/ do |arg1|
	@user = User.create!(:name => "UserName", :password => "pass")
	visit users_url
	fill_in "name", :with => "UserName"
	fill_in "password", :with => "pass"
	click_button "submit"
	visit uploads_url
	assert_contain "a.pdf"
end