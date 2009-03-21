class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :ref
      t.integer :type
      t.string :url
      t.text :text
      t.float :points
      t.string :c1
      t.string :c2
      t.string :c3
      t.string :c4
      t.string :c5
      t.string :answer
      t.text :explanation
      t.string :context
      t.integer :pc_error
      t.integer :capitalize
      t.integer :levenshtein
      t.integer :order
      t.integer :quiz_id
      t.timestamps
    end
    add_index :items, :ref
    add_index :items, :quiz_id
  end

  def self.down
    drop_table :items
  end
end
