Given /^that I am an administrator in a group$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id, :permission => 0)
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

Then /^I should be able to change it$/ do
  response.should contain("Make Administrator")
end

Given /^that I am regular member in a group$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id, :permission => 1)
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I try to change someones access level$/ do
  @user2 = User.create!(:name => "UserName2", :password => "pass")
  Membership.create!(:group_id => @group.id, :user_id => @user2.id, :permission => 1)
  visit group_users_url(@group.id)
end

When /^I try to remove a user$/ do
  @user2 = User.create!(:name => "UserName2", :password => "pass")
  Membership.create!(:group_id => @group.id, :user_id => @user2.id, :permission => 1)
  visit group_users_url(@group.id)
end

Then /^I should be able to remove them$/ do
  response.should contain("Remove")
end

Then /^it will not allow me to change their level$/ do
  response.should_not contain("Make Administrator")
end

Then /^it will not allow me to remove them$/ do
  response.should_not contain("Remove")
end