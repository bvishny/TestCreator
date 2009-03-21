class User < ActiveRecord::Base
  # Relationship Info
  has_many :quizzes
  has_many :takens
  
  # Attribute Security
  attr_accessible :name
  attr_accessible :username
  attr_accessible :email
  attr_accessible :password
  
  # Validations
  validates_confirmation_of :password
  validates_length_of :name, :minimum => 4
  validates_length_of :username, :minimum => 3
  validates_length_of :password, :within => 5..32
  validates_uniqueness_of :username
  
end
