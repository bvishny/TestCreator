class Changecolumntype < ActiveRecord::Migration
  def self.up
    change_column :takens, :score, :float
  end

  def self.down
  end
end
