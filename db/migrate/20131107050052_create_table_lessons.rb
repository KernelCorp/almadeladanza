class CreateTableLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :day
      t.integer :time
      t.references :coach
      t.references :hall
      t.timestamps
    end
  end
end
