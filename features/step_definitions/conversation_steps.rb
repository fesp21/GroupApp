Given /^that I am a user$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I write a message to another user$/ do
  @user2 = User.create!(:name => "UserName2", :password => "pass")
  @conversation = Conversation.create!(:origin => "UserName", :target => "UserName2", :message => "hi this is a test message")
  visit users_url(@user)
end

Then /^I should be able to see it on my home page$/ do
  visit users_url(@user)
  assert_contain "UserName2"
end


Given /^that I am a user$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  @user2 = User.create!(:name => "UserName2", :password => "pass")
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I see a message that I wrote $/ do
  @conversation = Conversation.create!(:origin => "UserName", :target => "UserName2", :message => "hi this is a test message")
  visit users_url(@user)
  assert_contain "UserName2"
end

Then /^I should be able to delete it$/ do
  visit users_url(@user)
  click_link "x"
  response.should_not contain("UserName2")
end

Given /^that I am a user$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  @user2 = User.create!(:name => "UserName2", :password => "pass")
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I see a message that someone wrote to me$/ do
  @conversation = Conversation.create!(:origin => "UserName2", :target => "UserName", :message => "hi this is a test message")
  visit users_url(@user)
end

Then /^I should be able to delete it$/ do
  visit users_url(@user)
  click_link "x"
  response.should_not contain("UserName2")
end