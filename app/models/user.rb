class User < ActiveRecord::Base

  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :email, presence: true
  validates :password, presence: true
  validates_length_of :password, :minimum => 4 
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase) 
    puts user.inspect
    # .downcase.strip to remove accidental whitespace and wrong casing 
    # if the user exists AND the password entered is correct..
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end

