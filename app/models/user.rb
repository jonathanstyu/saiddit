require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :token, :username, :password
  has_many :moderating_subs, 
    :class_name => "Sub", 
    :foreign_key => :moderator_id 

  has_many :submitted_links, 
    :class_name => "Link",
    :foreign_key => :submitter_id
  
  has_many :comments, 
    :foreign_key => :commenter_id
  
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
