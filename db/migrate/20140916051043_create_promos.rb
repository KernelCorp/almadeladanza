class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.attachment :image
      t.timestamps
    end
  end
end
