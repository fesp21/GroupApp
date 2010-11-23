require 'spec_helper'

describe Comment do
  before(:each) do
    @valid_attributes = {
	  :body => "hi",
	  :user_id => 1,
	  :post_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(@valid_attributes)
	Comment.find_by_body("hi").should_not be_nil
  end
  
  it "should delete a post when a user wants to delete it" do
    Comment.create!(@valid_attributes)
	Comment.destroy_all
	Comment.find_by_body("hi").should_not be_nil
  end
end
