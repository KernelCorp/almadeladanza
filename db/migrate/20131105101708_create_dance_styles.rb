class CreateDanceStyles < ActiveRecord::Migration
  def change
    create_table :dance_styles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
