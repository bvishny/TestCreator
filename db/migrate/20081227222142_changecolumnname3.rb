class Changecolumnname3 < ActiveRecord::Migration
  def self.up
    rename_column :answers, :question_id, :item_id
    add_index :answers, :item_id
    remove_index :answers, :question_id
  end
 
  def self.down
  end
end
 