class CreateTableGalleryEvents < ActiveRecord::Migration
  def change
    create_table :gallery_events do |t|
      t.string :title
      t.date :date
      t.timestamps
    end
  end
end
