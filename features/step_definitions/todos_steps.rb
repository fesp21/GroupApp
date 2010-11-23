When /^I click the "([^"]*)" link for the group$/ do |arg1|
  @todo = Todo.create!(:task => "milestone", :duedate => Time.now, :finished => false, :group_id => @group.id)
  visit group_todos_url(@group.id)
end

When /^I add a new todo with description "([^"]*)"$/ do |arg1|
  @todo = Todo.create!(:task => arg1, :duedate => Time.now, :finished => false, :group_id => @group.id)
end

Then /^I should be able to delete the todo$/ do
  response.should contain("delete")
end

Then /^I should see "([^"]*)" in the group's todos page$/ do |arg1|
	visit group_todos_url(@group.id)
	response.should contain(arg1)
end

When /^I try to edit a todo named "([^"]*)"$/ do |arg1|
  @todo = Todo.create!(:task => arg1, :duedate => Time.now, :finished => false, :group_id => @group.id)
  visit group_todos_url(@group.id)
end

Then /^I should see the edit page for "([^"]*)"$/ do |arg1|
  response.should contain(arg1)
  response.should contain("edit")
end

When /^I mark a todo finished$/ do
  @todo = Todo.create!(:task => "Mileston", :duedate => Time.now, :finished => false, :group_id => @group.id)
  visit group_todos_url(@group.id)
  click_link("mark finished")
end

Then /^I should see the todo marked as finished$/ do
  response.should contain("unmark finished")
end

When /^I mark a todo unfinished$/ do
  @todo = Todo.create!(:task => "Mileston", :duedate => Time.now, :finished => true, :group_id => @group.id)
  visit group_todos_url(@group.id)
  click_link("unmark finished")
end

Then /^I should see the todo marked as unfinished$/ do
  response.should contain("mark finished")
end