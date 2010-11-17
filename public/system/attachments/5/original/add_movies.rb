Given /^that I'm on the New Movies page$/ do
  visit movies_path
  click_link "New Movie"
end

When /^I enter a title of a movie$/ do

end

Then /^the app should give me the first five results from TMDb for the movie$/ do

end

Given /^that I'm looking at the first five results from TMDb for the movie I searched for$/ do
  
end

When /^I pick one of the five movies$/ do

end

When /^not "([^"]*)"$/ do |arg1|
  
end

Then /^the app should fill in the overview, scores, rating, release date, and genre\(s\)$/ do
  
end

Then /^the record should be saved to the database after prompting the user$/ do
  visit movies_path
end

Given /^that I'm on the New Movies Page$/ do
  visit new_movie_path
end

When /^I search for a movie title$/ do
  visit new_movie_path
end

When /^that movie isn't found in TMDb$/ do

end

Then /^I should be able to enter another title to search for$/ do
  visit new_movie_path
end

Then /^there should be a message saying "([^"]*)"$/ do |arg1|
  visit new_movie_path
end

Then /^I should be kept on the search page$/ do
  visit new_movie_path
end