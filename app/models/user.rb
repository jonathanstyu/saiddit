require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :token, :username, :password
  
  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end
  
  def verify_password(password)
    BCrypt::Password.new(self.password_hash) == password
  end
  
  def generate_session_token!
    self.token = SecureRandom.urlsafe_base64(35)
    self.save!
    self.token 
  end
end
