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
      0 => '10.00-11.15',
      1 => '11.30-12.45',
      2 => '13.00-14.15',
      3 => '14.30-15.45',
      4 => '16.00-17.15',
      5 => '17.30-18.45',
      6 => '19.00-20.15',
      7 => '20.30-21.45'
  }

  attr_accessible :day, :time, :dance_style_id, :coach_id, :hall_id
  belongs_to :coach
  belongs_to :hall
  belongs_to :dance_style

  def day_as_string
    LessonDay[self.day]
  end

  def time_as_string
    LessonTime[self.time]
  end

  def time=(value)
    write_attribute :time, time_to_i(value)
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
    return LessonTime.key value
  end

end