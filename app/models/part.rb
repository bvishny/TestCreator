class Part < ActiveRecord::Base
  # Relationship Info
  belongs_to :library
  
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
end
