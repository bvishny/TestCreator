class Taken < ActiveRecord::Base
  # Relationship Info
  belongs_to :user
  belongs_to :quiz
  has_many :answers
end
