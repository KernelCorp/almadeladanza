class AddSlugToDanceStyles < ActiveRecord::Migration
  def change
    add_column :dance_styles, :slug, :string
    add_index :dance_styles, :slug, unique: true
    DanceStyle.find_each(&:save)
  end
end
