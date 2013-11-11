class AddDefaultHalls < ActiveRecord::Migration
  def change
    Hall.create!(name: 'hall-1')
    Hall.create!(name: 'hall-2')
  end
end
