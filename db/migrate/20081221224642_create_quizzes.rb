class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.string :ref
      t.integer :password_protect
      t.string :password
      t.datetime :startdate
      t.datetime :enddate
      t.integer :attempts
      t.integer :total
      t.integer :scale
      t.string :name
      t.integer :searchable
      t.integer :theme_id
      t.integer :user_id
      t.string :loadfile
      t.integer :random_quiz
      t.timestamps
    end
    add_index :quizzes, :ref
    add_index :quizzes, :theme_id
    add_index :quizzes, :user_id
  end

  def self.down
    drop_table :quizzes
  end
end
