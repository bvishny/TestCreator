class Changecolumnname2 < ActiveRecord::Migration
  def self.up
    rename_column :items, :order, :order_index
    rename_column :parts, :order, :order_index
  end

  def self.down
  end
end
