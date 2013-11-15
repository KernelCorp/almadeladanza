class AddGalleryEventsReferencesToImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.references :gallery_event
    end
  end
end
