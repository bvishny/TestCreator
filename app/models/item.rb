class Item < ActiveRecord::Base
  # Relationship Info
  belongs_to :quiz
  has_many :answers
  
  # Attribute Security
  attr_accessible :url
  attr_accessible :text
  attr_accessible :points
  attr_accessible :c1
  attr_accessible :c2
  attr_accessible :c3
  attr_accessible :c4
  attr_accessible :c5
  attr_accessible :answer
  attr_accessible :explanation
  attr_accessible :context
  attr_accessible :pc_error
  attr_accessible :capitalize
  attr_accessible :levenshtein
 
  # Validations
  validates_length_of :text, :within => 0..1000
  validates_length_of :c1, :maximum => 500
  validates_length_of :c2, :maximum => 500
  validates_length_of :c3, :maximum => 500
  validates_length_of :c4, :maximum => 500
  validates_length_of :c5, :maximum => 500
  validates_length_of :answer, :within => 0..100
  validates_length_of :explanation, :maximum => 500
  validates_length_of :context, :maximum => 50
end
