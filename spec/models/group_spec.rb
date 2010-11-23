require 'spec_helper'

describe Group do
  before(:each) do
    @valid_attributes = {
      :name => "GroupName",
	  :description => "description"
    }
  end
  
  it "should create a group given valid attributes" do
    Group.create!(@valid_attributes)
  end
  
  it "should be able to have admins" do
	@user = User.create!(:name => "username", :password => "password")
    @group = Group.create!(@valid_attributes)
	Membership.create!(:group_id => @group.id, :user_id => @user.id, :permission => 0)
  end
  
  it "should be able to have normal users" do
    @user = User.create!(:name => "username", :password => "password")
    @group = Group.create!(@valid_attributes)
	Membership.create!(:group_id => @group.id, :user_id => @user.id, :permission => 1)
  end
  
end
