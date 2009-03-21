class CreateTakens < ActiveRecord::Migration
  def self.up
    create_table :takens do |t|
      t.string :ref
      t.integer :quiz_id
      t.integer :status
      t.integer :user_id
      t.integer :score
      t.timestamps
    end
    add_index :takens, :ref
    add_index :takens, :quiz_id
    add_index :takens, :user_id
  end

  def self.down
    drop_table :takens
  end
end
