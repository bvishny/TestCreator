class CreateLibraries < ActiveRecord::Migration
  def self.up
    create_table :libraries do |t|
      t.string :ref
      t.integer :user_id
      t.string :name
      t.integer :rand_allowed
      t.integer :public_read
      t.integer :public_write
      t.string :description
      t.timestamps
    end
    add_index :libraries, :ref
    add_index :libraries, :user_id
  end

  def self.down
    drop_table :libraries
  end
end
