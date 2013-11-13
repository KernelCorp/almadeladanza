Given(/^Style named "(.*?)"$/) do |style_name|
  DanceStyle.create! name: style_name
end

Given(/^Coach named "(.*?)", Style \- "(.*?)"$/) do |coach_name, style_name|
  @dance_style = DanceStyle.find_by_name style_name
  @dance_style.coaches.create! name: coach_name, email: coach_name+'@mail.ru', password: 'password'
end

Given(/^"(.*?)" lesson at on "(.*?)" at (\d+):(\d+) in hall (\d+) coach "(.*?)"$/) do |style_name, week_day, start_hour, start_minute, hall_number, coach_name|
  @dance_style = DanceStyle.find_by_name style_name
  week_day_num = Lesson::LessonDay.key week_day.downcase
  start = start_hour.to_s+'.'+start_minute.to_s
  time_num = 0
  Lesson::LessonTime.each do |time|
    unless time[1].match(/^#{start}/).nil?
      time_num = time[0]
      break
    end
  end
  @coach = Coach.find_by_name coach_name
  Lesson.create! dance_style_id: @dance_style.id, day: week_day_num, time: time_num, hall_id: hall_number, coach_id: @coach.id
end

When(/^I click to "(.*?)"$/) do |style_name|
  find('a.ui-tabs-anchor', text: style_name).click
end

When(/^I click to day "(.*?)"$/) do |day_name|
  find('th a.day-zoom', text: day_name).click
end

Then(/^I should see calendar$/) do
  page.should have_css('table#schedule')
end

Then(/^I should see filter for styles$/) do
  page.should have_css('.ui-tabs-nav')
end

Then(/^I should see "(.*?)" in cell \("(.*?)", (\d+):(\d+)\), hall (\d+)$/) do |dance_style, week_day, start_hour, start_minute, hall_num|
  week_day_num = Lesson::LessonDay.key week_day.downcase
  start = start_hour.to_s+'.'+start_minute.to_s
  time_num = 0
  Lesson::LessonTime.each do |time|
    unless time[1].match(/^#{start}/).nil?
      time_num = time[0]
      break
    end
  end
  td_class = '.sc-day-'+week_day_num.to_s+'.sc-time-'+time_num.to_s+'.hall-'+hall_num.to_s
  page.should have_css(td_class, text: dance_style )
end

Then(/^I shouldn't see "(.*?)" in cell \("(.*?)", (\d+):(\d+)\), hall (\d+)$/) do |dance_style, week_day, start_hour, start_minute, hall_num|
  week_day_num = Lesson::LessonDay.key week_day.downcase
  start = start_hour.to_s+'.'+start_minute.to_s
  time_num = 0
  Lesson::LessonTime.each do |time|
    unless time[1].match(/^#{start}/).nil?
      time_num = time[0]
      break
    end
  end
  td_class = '.sc-day-'+week_day_num.to_s+'.sc-time-'+time_num.to_s+'.hall-'+hall_num.to_s
  page.should_not have_css(td_class, text: dance_style )
end


Then(/^I see "(.*?)" in cell \("(.*?)", (\d+):(\d+)\)$/) do |arg1, arg2, arg3, arg4|
  pending # express the regexp above with the code you wish you had
end


Then(/^I should see that column "(.*?)" is fatter than other$/) do |day_name|
  page.should have_css('.large', text: day_name)
end


When(/^I click to lesson "(.*?)" on Tuesday at (\d+):(\d+)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see pop up$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see link to coach "(.*?)" in popup$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see link to style "(.*?)" in popup$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see description "(.*?)" in popup$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see time in popup$/) do
  pending # express the regexp above with the code you wish you had
end


Then(/^I should see day in popup$/) do
  pending # express the regexp above with the code you wish you had
end


Then(/^I should see hall in popup$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I sign in as an admin$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click to button "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see grid for lesson$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click to cell \("(.*?)", (\d+):(\d+)\)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see form for lessons$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see select box for "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I click to "(.*?)" in cell \("(.*?)", (\d+):(\d+)\)$/) do |arg1, arg2, arg3, arg4|
  pending # express the regexp above with the code you wish you had
end

And(/^I select coach "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

And(/^I select hall (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end