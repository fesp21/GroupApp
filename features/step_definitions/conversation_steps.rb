Given /^that I am a conversation user$/ do
  @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
  @user2 = User.create!(:username => "UserName2", :email => "test2@yahoo.com", :password => "pass", :password_confirmation => "pass")
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "All Groups"
  click_link "New Group"
  fill_in "group_name", :with => "Jason's Group"
  fill_in "group_description", :with => "Jason's Group's description"
  click_button "group_submit"
  click_link "Logout"
  visit root_url
  fill_in "user_session_username", :with => "UserName2"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "All Groups"
  click_link "Join"
  click_link "Logout"
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
end

When /^I write a message to another user$/ do
  # @conversation = Conversation.create!(:origin => "UserName", :target => "UserName2", :group => @group.id, :message => "hi this is a test message")
  # visit group_path(@group)
  click_link "Jason's Group"
  select "UserName2", :from => "conversation_target"
  fill_in "conversation_message", :with => "hi this is a test message"
  click_button "conversation_submit"
end

Then /^I should be able to see it on my home page$/ do
  assert_contain "hi this is a test message"
end

When /^I see a message that I wrote$/ do
  click_link "Jason's Group"
  select "UserName2", :from => "conversation_target"
  fill_in "conversation_message", :with => "hi this is a test message"
  click_button "conversation_submit"
  assert_contain "hi this is a test message"
end

Then /^I should be able to delete the message$/ do
  click_link "x"
  response.should_not contain("hi this is a test message")
end

When /^I see a message that someone wrote to me$/ do
  click_link "Logout"
  visit root_url
  fill_in "user_session_username", :with => "UserName2"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "Jason's Group"
  selects "UserName", :from => "conversation_target"
  fill_in "conversation_message", :with => "hi this is a test message"
  click_button "conversation_submit"
  click_link "Logout"
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
  click_link "Jason's Group"
  assert_contain "hi this is a test message"
end