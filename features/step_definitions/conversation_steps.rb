Given /^that I am a conversation user$/ do
  @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
  @user2 = User.create!(:username => "UserName2", :email => "test2@yahoo.com", :password => "pass", :password_confirmation => "pass")
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I write a message to another user$/ do
  @conversation = Conversation.create!(:origin => "UserName", :target => "UserName2", :message => "hi this is a test message")
  visit users_url(@user)
end

Then /^I should be able to see it on my home page$/ do
  visit users_url(@user)
  assert_contain "UserName2"
end

When /^I see a message that I wrote $/ do
  @conversation = Conversation.create!(:origin => "UserName", :target => "UserName2", :message => "hi this is a test message")
  visit users_url(@user)
  assert_contain "UserName2"
end

Then /^I should be able to delete the message$/ do
  visit users_url(@user)
  click_link "x"
  response.should_not contain("UserName2")
end

When /^I see a message that someone wrote to me$/ do
  @conversation = Conversation.create!(:origin => "UserName2", :target => "UserName", :message => "hi this is a test message")
  visit users_url(@user)
end