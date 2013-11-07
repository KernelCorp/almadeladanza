Given /^I sign in as admin$/ do
  AdminUser.new({:email => 'admin@example.com', :username => 'admin', :password => 'password'}).save! if AdminUser.where(:email => 'admin@example.com').first.nil?
  visit "/admin"
  within '#session_new' do
    fill_in 'user[login]', :with => 'admin@example.com'
    fill_in 'user[password]', :with => 'password'
  end
  find("#user_submit_action input").click
end

Given /^DanceStyle with name: "(.*)", description: "(.*)"$/ do |name, desc|
  DanceStyle.new({:name => name, :description => desc}).save! if Style.where(:name => name).first.nil?
end

When /^I go to "(.*)"$/ do |location|
  visit location
end

Then /^I should see DanceStyles list with 2 items: "(.*)" "(.*)"$/ do |first, second|
  #page.should have_css()
end

And /^Element "(.*)" is active*/ do |first|
  #page.should have_css()
end

And /^I should see description: "(.*)"$/ do
  #page.should have_css()
end

And /^I click to list element "(.*)"$/ do |elem|
  #find().click
end

And /^I click on button "(.*)"$/ do |button|
  #find().click
end

Then /^I should see action "(.*)"$/ do |action|
  #page.should have_css()
end

Then /^I should see form for "(.*)"$/ do |model|
  #page.should have_css()
end

And /^I should see checkboxes for coaches$/ do
  #page.should have_css()
end