require 'spec_helper'

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "test",
	  :body => "hi",
	  :user => "bob",
	  :user_id => 1,
	  :group_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
	Post.find_by_title("test").should_not be_nil
  end
  
  it "should delete a post when a user wants to delete it" do
    Post.create!(@valid_attributes)
	Post.destroy_all
	Post.find_by_title("test").should be_nil
  end
end
