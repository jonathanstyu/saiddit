class User < ActiveRecord::Base
  attr_accessible :token, :username
  
  def password=(password)
    include BCrypt 
    self.password_hash = BCrypt::Password.create(password)
  end
  
  def verify_password(password)
    BCrypt::Password.new(self.password_hash) == password
  end
end
