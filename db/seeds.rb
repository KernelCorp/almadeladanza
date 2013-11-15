# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

coaches = Coach.all
held = []
coaches.each do |coach|
  hash = {}
  loop do
    hash =  {
        day: rand(7),
        time: rand(8),
        hall_id: (rand(2) == 0)? Hall.last.id : Hall.first.id
    }
    Lesson.where(hash).empty? ? break : next
  end
  Lesson.create! coach_id:       coach.id,
                 dance_style_id: coach.dance_styles.first.id,
                 hall_id:        hash[:hall_id].id,
                 day:            hash[:day],
                 time:           hash[:time]

end