class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string :ref
      t.string :css_rel
      t.integer :items_per_page
      t.timestamps
    end
    add_index :themes, :ref
  end

  def self.down
    drop_table :themes
  end
end
