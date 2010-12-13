require 'spec_helper'

describe Conversation do
  before(:each) do
    @user = User.create!(:username => "UserName", :email => "test@yahoo.com", :password => "pass", :password_confirmation => "pass")
    @user2 = User.create!(:username => "UserName2", :email => "test@gmail.com", :password => "pass", :password_confirmation => "pass")
    @valid_attributes = {
	  :origin => "UserName",
	  :target => "UserName2",
	  :message => "hi"
    }
  end

  it "should create a new instance given valid attributes" do
    Conversation.create!(@valid_attributes)
	  Conversation.find_by_message("hi").should_not be_nil
  end
  
  it "should delete a post when a user wants to delete it" do
    Conversation.create!(@valid_attributes)
	  Conversation.destroy_all
	  Conversation.find_by_message("hi").should be_nil
  end
end