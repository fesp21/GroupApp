require 'spec_helper'

describe Todo do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a todo given that a user wants to create a todo" do
    @group = Group.create!(:name => "GroupName", :description => "description")
  	@todo = Todo.create!(:task => "Milestone", :duedate => Time.now, :finished => false, :group_id => @group.id)
	  @todo.should_not be_nil
  end
  
  it "should delete a todo given that a user wants to delete a todo" do
    @group = Group.create!(:name => "GroupName", :description => "description")
  	@todo = Todo.create!(:task => "Milestone", :duedate => Time.now, :finished => false, :group_id => @group.id)
	  Todo.find_by_id(@todo.id).destroy
	  Todo.find_by_task("Milestone").should be_nil
  end
  
  it "should be finished given that a user wants to mark it as finished" do
    @group = Group.create!(:name => "GroupName", :description => "description")
  	@todo = Todo.create!(:task => "Milestone", :duedate => Time.now, :finished => false, :group_id => @group.id)
	  @todo.finished = true
    @todo.save
    @todo.finished.should be_true
  end
  
  it "should be unfinished given that a user wants to mark it as unfinished" do
    @group = Group.create!(:name => "GroupName", :description => "description")
  	@todo = Todo.create!(:task => "Milestone", :duedate => Time.now, :finished => true, :group_id => @group.id)
	  @todo.finished = false
    @todo.save
    @todo.finished.should be_false
  end
end
