Given /^that I am an administrator$/ do
  @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id)
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
end

When /^I see a bad post$/ do
  @post = Post.create!(:title => "test post", :body => "Hi", :user => @user, :group_id => @group.id, :user_id => @user.id)
  visit group_posts_url(@group)
end

Then /^I should be able to delete the bad post$/ do
  click_link "Delete"
  response.should_not contain("test post")
end

Given /^that I am a post user$/ do
  @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id)
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
end

When /^I post a message$/ do
  @post = Post.create!(:title => "test", :body => "Hi", :user => @user, :group_id => @group.id)
  visit group_posts_url(@group)
  #click_link "test"
end

Then /^I should be able to see it on the post page$/ do
  visit group_posts_url(@group)
  assert_contain "test"
end

When /^I see a post$/ do
  @post = Post.create!(:title => "test", :body => "Hi", :user => "bob", :group_id => @group.id, :user_id => @user.id)
  visit group_posts_url(@group)
  assert_contain "test"
end

Then /^I should be able to comment on it$/ do
  @comment = @post.comments.create!(:body => "cool", :user_id => @user.id)
  visit group_posts_url(@group)
  fill_in "comment_body", :with => "hi hi hi hi"
  click_button "comment_submit"
  assert_contain "hi hi hi hi"
end

Given /^that I am a comment user$/ do
  @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id)
  visit root_url
  fill_in "user_session_username", :with => "UserName"
  fill_in "user_session_password", :with => "pass"
  click_button "submit"
end

When /^I see a comment that is mine$/ do
  @post = Post.create!(:title => "test", :body => "Hi", :user => "bob", :group_id => @group.id, :user_id => @user.id)
  @comment = @post.comments.create!(:body => "cool", :user_id => @user.id)
  visit group_posts_url(@group)
  assert_contain "cool"
end

Then /^I should be able to delete the comment$/ do
  click_link "Delete"
  response.should_not contain("cool")
end
