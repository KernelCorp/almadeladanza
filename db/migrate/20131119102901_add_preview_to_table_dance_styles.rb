class AddPreviewToTableDanceStyles < ActiveRecord::Migration
  def change
    change_table :dance_styles do |t|
      t.text :preview
    end
  end
end
