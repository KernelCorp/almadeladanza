class CreateCoachesDanceStyles < ActiveRecord::Migration
  def self.up
    create_table :coaches_dance_styles, :id => false do |t|
      t.references :coach
      t.references :dance_style
    end
    add_index :coaches_dance_styles, [:coach_id, :dance_style_id]
    add_index :coaches_dance_styles, :coach_id
  end

  def self.down
    drop_table :coaches_dance_styles
  end
end
