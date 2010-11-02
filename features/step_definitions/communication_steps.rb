Given /^that I am an administrator$/ do
  @user = "admin"
end

When /^I see a bad post$/ do
  @post = Post.create!(:title => "test post", :body => "Hi", :user => @user)
end

Then /^I should be able to delete it$/ do
  @post.destroy
end

Given /^that I am a post user$/ do
  @user = "bob"
end

When /^I post a message$/ do
  @post = Post.create!(:title => "test post", :body => "Hi", :user => @user)
end

Then /^I should be able to see it on the post page$/ do
  Post.find(:all) == @post 
end

When /^I see a post$/ do
  @post = Post.create!(:title => "test post", :body => "Hi", :user => "bob")
end

Then /^I should be able to comment on it$/ do
  @comment = @post.comments.create!(:body => "cool")
end