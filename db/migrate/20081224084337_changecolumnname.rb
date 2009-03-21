class Changecolumnname < ActiveRecord::Migration
  def self.up
    rename_column :items, :type, :type2
    rename_column :parts, :type, :type2
  end

  def self.down
  end
end
