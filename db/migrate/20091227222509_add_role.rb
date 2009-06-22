class AddRole < ActiveRecord::Migration
  def self.up
   add_column :users, :role, :integer, :default => 0
  end

  def self.down
  end
end
