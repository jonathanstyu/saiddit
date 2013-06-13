require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :token, :username, :password
  
  validates :token, :username, :presence => true 
  
  has_many :moderating_subs, 
    :class_name => "Sub", 
    :foreign_key => :moderator_id, 
    :dependent => :destroy # seems like a bad thing to do here 

  has_many :submitted_links, 
    :class_name => "Link",
    :foreign_key => :submitter_id, 
    :dependent => :destroy
  
  has_many :comments, 
    :foreign_key => :commenter_id, 
    :dependent => :destroy, 
    :inverse_of => :commenter
  
  has_many :votes, 
    :foreign_key => :voter_id,
    :class_name => "UserVote"
  
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
