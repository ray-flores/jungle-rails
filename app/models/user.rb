class User < ActiveRecord::Base

  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :email, presence: true
  validates :password, presence: true
  validates_length_of :password, :minimum => 4 
  validates :password_confirmation, presence: true

end

