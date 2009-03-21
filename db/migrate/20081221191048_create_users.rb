class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :ref
      t.string :email
      t.string :username
      t.string :ip
      t.datetime :last_login
      t.string :useragent
      t.string :password
      t.timestamps
    end
    add_index :users, :ref
    add_index :users, :username
  end

  def self.down
    drop_table :users
  end
end
