And /^I add image "(.*)"$/ do |url|
  image = InteriorImage.new
  file = File.open(File.expand_path(url, __FILE__ ))
  image.path = file
  image.save!
  file.close
  visit "/admin/interior_images"
end

Then /^I should see image "(.*)" in images list$/ do |url|
  page.should have_css('img')
end

And /^Interiors contain image "(.*)"$/ do |url|
  image = InteriorImage.new
  file = File.open(File.expand_path(url, __FILE__ ))
  image.path = file
  image.save!
  file.close
end

Then /^Image "(.*)" should be removed from image list$/ do |url|
  page.should_not have_css('img')
end

Then /^I should see carousel$/ do

end

And /^I should see image "(.*)"$/ do |url|

end