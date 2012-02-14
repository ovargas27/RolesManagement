Given /^A post exists$/ do
  @resource = Post.create!(title: 'foo post')
end

Given /^I am visit post page$/ do
  steps %Q{
     Given A post exists
  }
  visit post_path(@resource)
end

Given /^I am try to create new post$/ do
  visit new_post_path
end

Given /^I am try to edit post$/ do
  steps %Q{
     Given A post exists
  }
  visit edit_post_path(@resource)
end

