class CreateTablePriceLists < ActiveRecord::Migration
  def change
    create_table :price_lists do |t|
      t.text :content
      t.timestamps
    end
    PriceList.create!
  end
end
