class CreateTablePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :preview
      t.text :body
      t.references :coach
    end
  end
end
