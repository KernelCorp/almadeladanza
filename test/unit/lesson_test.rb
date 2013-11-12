require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test 'day_getter' do
    @lesson = Lesson.create(:day => 2)
    assert_equal @lesson.day_as_string, 'wednesday'
  end

  test 'day_setter' do
    @lesson = Lesson.create(:day => 2)
    @lesson.day = 1
    assert_equal @lesson.day_as_string, 'tuesday'
    @lesson.day = '6'
    assert_equal @lesson.day_as_string, 'sunday'
    @lesson.day = 'monday'
    assert_equal @lesson.day_as_string, 'monday'
    assert_equal @lesson.day, 0
  end


  test 'time_getter' do
    @lesson = Lesson.create(:time => 4)
    assert_equal @lesson.time_as_string, '16.00-17.15'
  end

  test 'time_setter' do
    @lesson = Lesson.create(:time => 4)
    @lesson.time = 1
    assert_equal @lesson.time_as_string, '11.30-12.45'
    @lesson.time = '2'
    assert_equal @lesson.time_as_string, '13.00-14.15'
    @lesson.time = '19.00-20.15'
    assert_equal @lesson.time_as_string, '19.00-20.15'
    assert_equal @lesson.time, 6
  end

end