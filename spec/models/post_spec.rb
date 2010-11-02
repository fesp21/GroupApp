require 'spec_helper'

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "test",
	  :body => "hi",
	  :user => "bob"
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
end
