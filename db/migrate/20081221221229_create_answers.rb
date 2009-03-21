class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :question_id
      t.string :ref
      t.integer :taken_id
      t.string :answer
      t.integer :score
      t.integer :correct
      t.timestamps
    end
    add_index :answers, :question_id
    add_index :answers, :ref
    add_index :answers, :taken_id
  end

  def self.down
    drop_table :answers
  end
end
