Given /^that I am an administrator$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id)
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I see a bad post$/ do
  @post = Post.create!(:title => "test post", :body => "Hi", :user => @user, :group_id => @group.id)
  visit group_posts_url(@group)
end

Then /^I should be able to delete it$/ do
  click_link "test post"
  click_link "Destroy"
  response.should_not contain("test post")
end

Given /^that I am a post user$/ do
  @user = User.create!(:name => "UserName", :password => "pass")
  @group = Group.create!(:name => "GroupName", :description => "description")
  @membership = Membership.create!(:group_id => @group.id, :user_id => @user.id)
  visit users_url
  fill_in "name", :with => "UserName"
  fill_in "password", :with => "pass"
  click_button "submit"
end

When /^I post a message$/ do
  @post = Post.create!(:title => "test", :body => "Hi", :user => @user, :group_id => @group.id)
  visit group_posts_url(@group)
  click_link "test"
end

Then /^I should be able to see it on the post page$/ do
  visit group_posts_url(@group)
  assert_contain "test"
end

When /^I see a post$/ do
  @post = Post.create!(:title => "test", :body => "Hi", :user => "bob", :group_id => @group.id)
  visit group_posts_url(@group)
  assert_contain "test"
end

Then /^I should be able to comment on it$/ do
  @comment = @post.comments.create!(:body => "cool")
  visit group_posts_url(@group)
  click_link "test"
  assert_contain "cool"
end