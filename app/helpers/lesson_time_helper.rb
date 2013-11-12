module LessonTimeHelper

  def style_time(time)
    start_hour =  time.match(/^\d\d/)[0]
    start_minute =  time.match(/\.\d\d-/)[0]
    start_minute = start_minute.gsub /\D+/, ''
    finish_hour = time.match(/-\d\d./)[0]
    finish_hour = finish_hour.gsub /\D+/, ''
    finish_minute = time.match(/\d\d$/)[0]
    start_hour+'<sup>'+start_minute+'</sup>-'+finish_hour+'<sup>'+finish_minute+'</sup>'
  end

end