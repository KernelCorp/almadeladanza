#encoding: UTF-8

class AddDefaultDanceStyles < ActiveRecord::Migration
  def up
    DanceStyle.create!(name: 'Бальные танцы', description: 'Танцы бальные, дом труба шатальные.')
    DanceStyle.create!(name: 'Современные танцы', description: 'Танцы современные, очень офигенные!')
    DanceStyle.create!(name: 'Танцы народов мира', description: 'От Камчатки до Памира.')
    DanceStyle.create!(name: 'Театральные танцы', description: 'На занятия сланцы!')
    DanceStyle.create!(name: 'Танцевальная йога', description: 'Как учил Мастер Гога')
    DanceStyle.create!(name: 'Приватные танцы', description: 'Только республиканцы!')
    DanceStyle.create!(name: 'Стрейчинг', description: 'Такие дела.')
  end

  def down
    DanceStyle.all destroy
  end
end
