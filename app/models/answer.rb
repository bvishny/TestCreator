class Answer < ActiveRecord::Base
  # Relationship Info
  belongs_to :taken
  has_one :item
  
  # Attribute Security
  attr_accessible :answer
end
