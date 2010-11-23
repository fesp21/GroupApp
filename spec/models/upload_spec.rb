require 'spec_helper'

describe Upload do
  before(:each) do
    @valid_attributes = {
      
    }
  end
  
  it "should delete a file given that a user wants to delete a file" do
    @group = Group.create!(:name => "GroupName", :description => "description")
  	@file = Upload.create!(:group_id => @group.id,
					:filename => 'abc.pdf',
					:description => 'description of the file here')
	Upload.destroy_all
	Upload.find_by_filename("abc.pdf").should be_nil
  end
  
  it "should create a file given that a user wants to create a file" do
    @group = Group.create!(:name => "GroupName", :description => "description")
  	@file = Upload.create!(:group_id => @group.id,
					:filename => 'abc.pdf',
					:description => 'description of the file here')
	@file.should_not be_nil
  
  end
  
  it "should let the user download a file" do
    @group = Group.create!(:name => "GroupName", :description => "description")
  	@file = Upload.create!(:group_id => @group.id,
					:filename => 'abc.pdf',
					:description => 'description of the file here')
	@file.attachment.url.should_not be_nil
  end
  
end
