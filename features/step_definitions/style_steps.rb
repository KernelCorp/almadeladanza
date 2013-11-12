Given /^I sign in as admin$/ do
  AdminUser.new({:email => 'admin@example.com', :password => 'password'}).save! if AdminUser.where(:email => 'admin@example.com').first.nil?
  visit "/admin"
  within '#session_new' do
    fill_in 'user[email]', :with => 'admin@example.com'
    fill_in 'user[password]', :with => 'password'
  end
  find("#user_submit_action input").click
end

Given /^DanceStyle with name: "(.*)", description: "(.*)"$/ do |name, desc|
  DanceStyle.new({:name => name, :description => desc}).save! if DanceStyle.where(:name => name).first.nil?
end

When /^I go to "(.*)"$/ do |location|
  visit location
end

Then /^I should see DanceStyles list with 2 items: "(.*)" "(.*)"$/ do |first, second|
  page.should have_css('span', text: first)
  page.should have_css('span', text: second)
end

And /^Element "(.*)" is active*/ do |elem|
  page.should have_css('li.ui-tabs-active', text: elem)
end

And /^I should see description: "(.*)"$/ do |desc|
  page.should have_css('p', text: desc)
end

And /^I click to list element "(.*)"$/ do |elem|
  find('span', text: elem).click
end

And /^I click on button "(.*)"$/ do |button|
  find('a', text: button).click
end

Then /^I should see action Create$/ do
  page.should have_css('a', text: 'New Dance Style')
end

And /^I should see action "(.*)"$/ do |action|
  page.should have_css('a', text: action)
end

Then /^I should see form for "(.*)"$/ do |model|
  page.should have_css('.formtastic.dance_style')
end

And /^I should see checkboxes for coaches$/ do
  page.should have_css('#dance_style_coaches_input')
end