class AddTimeZone < ActiveRecord::Migration
  def self.up
   add_column :users, :time_zone, :integer, :default => 0
  end

  def self.down
  end
end
