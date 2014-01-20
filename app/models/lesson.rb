class Lesson < ActiveRecord::Base
  LessonDay = {
      0 => 'monday',
      1 => 'tuesday',
      2 => 'wednesday',
      3 => 'thursday',
      4 => 'friday',
      5 => 'saturday',
      6 => 'sunday'
  }

  LessonTime = {
      0 => '10.00-11.00',
      1 => '10.30-11.30',
      2 => '11.00-12.00',
      3 => '11.30-12.30',
      4 => '12.00-13.00',
      5 => '12.30-13.30',
      6 => '13.00-14.00',
      7 => '13.30-14.30',
      8 => '14.00-15.00',
      9 => '14.30-15.30',
      10 => '15.00-16.00',
      11 => '15.30-16.30',
      12 => '16.00-17.00',
      13 => '16.30-17.30',
      14 => '17.00-18.00',
      15 => '17.30-18.30',
      16 => '18.00-19.00',
      17 => '18.30-19.30',
      18 => '19.00-20.00',
      19 => '19.30-20.30',
      20 => '20.00-21.00',
      21 => '20.30-21.30',
      22 => '21.00-22.00',
      23 => '21.30-22.30'
  }


  attr_accessible :day, :time, :dance_style_id, :coach_id, :hall_id
  belongs_to :coach
  belongs_to :hall
  belongs_to :dance_style

  def day_as_string
    LessonDay[self.day]
  end

  def time_as_string
    return LessonTime[self.time]
  end


  def day=(value)
    write_attribute :day, day_to_i(value)
  end

  def self.day_filter(day)
    return Lesson.where(day: day) if day.is_a? Integer
    return Lesson.where(day: day.to_i) if (day.is_a? String) && (day =~ /^\d+$/)
    return Lesson.where(day: Lesson::LessonDay.key(day)) if (day.is_a? String) && (day !=~ /^\d+$/)
  end

  private

  def day_to_i(value)
    return value if value.is_a? Integer
    return value.to_i if value.is_a?(String) && (value =~ /^\d+$/)
    return LessonDay.key value
  end

  def time_to_i(value)
    return value if value.is_a? Integer
    return value.to_i if value.is_a?(String) && (value =~ /^\d+$/)
    return LessonTime.key(value)
  end

end