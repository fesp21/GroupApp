require 'spec_helper'

describe Upload do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Upload.create!(@valid_attributes)
  end
  
  it "should delete a file given that a user wants to delete a file" do
	@file = Upload.new(:gid => 1, 
					:filename => 'abc.pdf',
					:description => 'description of the file here')
	Upload.destroy_all
	Upload.find_by_filename("abc.pdf").should be_nil
  end
  
  it "should create a file given that a user wants to create a file" do
	@file = Upload.new(:gid => 1, 
					:filename => 'abc.pdf',
					:description => 'description of the file here')
	@file.should_not be_nil
  
  end
  
  it "should let the user download a file" do
  	@file = Upload.create!(:gid => 1, 
					:filename => 'abc.pdf',
					:description => 'description of the file here')
	@file.attachment.url.should_not be_nil
  end
  
end
