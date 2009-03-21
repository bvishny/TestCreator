class Library < ActiveRecord::Base
  # Relationship Info
  has_many :parts
  belongs_to :user
  
  # Attribute Security
  attr_accessible :name
  attr_accessible :rand_allowed
  attr_accessible :public_read
  attr_accessible :public_write
  attr_accessible :description
  
  # Validations
  validates_length_of :name, :within => 1..50
  validates_numericality_of :rand_allowed
  validates_numericality_of :public_read
  validates_numericality_of :public_write
  validates_length_of :description, :maximum => 300
end
