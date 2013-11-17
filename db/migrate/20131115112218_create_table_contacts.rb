class CreateTableContacts < ActiveRecord::Migration
  def change
    create_table :contacts  do |t|
      t.string :phone
      t.string :email
      t.string :address
    end
  end
end
