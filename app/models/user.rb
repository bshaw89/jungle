class User < ActiveRecord::Base
  
  attr_accessor :email, :first_name, :last_name
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  validates :email, presence: true, uniqueness: true
  validates_length_of :password, minimum: 5
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end

