class Quiz < ActiveRecord::Base
  # Relationship Info
  has_many :items
  belongs_to :user
  has_many :takens
  has_one :theme
  
  # Attribute Security
  attr_accessible :password_protect
  attr_accessible :password
  attr_accessible :startdate
  attr_accessible :enddate
  attr_accessible :attempts
  attr_accessible :total
  attr_accessible :scale
  attr_accessible :searchable
  attr_accessible :name
  attr_accessible :theme_id
  attr_accessible :random_quiz
  
  # Validations
  validates_length_of :name, :within => 3..32
end
