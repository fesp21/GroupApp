Given /^that I am an administrator in a group$/ do
  @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
  @user2 = User.create!(:username => "UserName2", :email => "test3@yahoo.com", :password => "pass", :password_confirmation => "pass")
  #@group = Group.create!(:name => "GroupName", :description => "description")
  #Membership.create!(:group_id => @group.id, :user_id => @user2.id, :permission => 1)
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "All Groups"
  click_link "New Group"
  fill_in "group_name", :with => "Jason's Group"
  fill_in "group_description", :with => "Jason's Group's description"
  click_button "group_submit"
  # at this point you'll be in the group home page
end

Then /^I should be able to change it$/ do
  click_link "Settings"
  #fill_in "group_description", :with => "changed description"
  #click_button "group_submit"
  response.should contain("Jason's Group")
end

Given /^that I am regular member in a group$/ do
  @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
  @user2 = User.create!(:username => "UserName2", :email => "test3@yahoo.com", :password => "pass", :password_confirmation => "pass")
  #@group = Group.create!(:name => "GroupName", :description => "description")
  #Membership.create!(:group_id => @group.id, :user_id => @user2.id, :permission => 1)
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "All Groups"
  click_link "New Group"
  fill_in "group_name", :with => "Jason's Group"
  fill_in "group_description", :with => "Jason's Group's description"
  click_button "group_submit"

end

When /^I try to change someones access level$/ do
  visit group_path(@group)
end

When /^I try to remove a user$/ do
  click_link "Logout"
  visit root_url
  fill_in "user_session_username", :with => "UserName2"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "All Groups"
  response.should contain("Join")
  click_link "Join"
  click_link "Logout"
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "Jason's Group"
end

Then /^I should be able to remove them$/ do
  click_link "Members"
  response.should contain("Remove User")
end

Then /^it will not allow me to change their level$/ do
  click_link "Members"
  response.should_not contain("Make Administrator")
end

Then /^it will not allow me to remove them$/ do
  click_link "Logout"
  visit root_url
  fill_in "user_session_username", :with => "UserName2"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "All Groups"
  click_link "Jason's Group"
  click_link "Members"
  response.should_not contain("Remove")
end