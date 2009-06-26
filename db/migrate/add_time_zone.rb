class AddTimeZone < ActiveRecord::Migration
  def self.up
   add_column :users, :time_zone, :string, :default => "UTC"
  end

  def self.down
  end
end
