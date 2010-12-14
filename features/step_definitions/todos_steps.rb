When /^I click the todos link for the group$/ do
  click_link "All Groups"
  click_link "New Group"
  fill_in "group_name", :with => "Jason's Group"
  fill_in "group_description", :with => "Jason's Group's description"
  click_button "group_submit"
  click_link "To-Do List"
end

When /^create a todo list$/ do
  fill_in "todo_task", :with => "jason's task"
  click_button "todo_submit"
end

Then /^I should be able to delete the todo$/ do
  response.should contain("delete")
end

Then /^I should see the todo list in the groups todos page$/ do
	response.should contain("jason's task")
end

And /^I try to edit the todo list$/ do
  click_link "edit"
end

Then /^I should see the edit page$/ do
  response.should contain("Jason's Group")
  response.should contain("Back")
end

And /^I mark a todo finished$/ do
  click_link "mark finished"
end

Then /^I should see the todo marked as finished$/ do
  response.should contain("unmark finished")
end

And /^I mark a todo unfinished$/ do
  click_link "unmark finished"
end

Then /^I should see the todo marked as unfinished$/ do
  response.should contain("mark finished")
end