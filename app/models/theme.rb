class Theme < ActiveRecord::Base
  # Relationship Info
  belongs_to :quiz
  
  # Attribute Security
  attr_accessible :items_per_page
  
  # Validations
  validates_numericality_of :items_per_page
end
