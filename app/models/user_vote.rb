class UserVote < ActiveRecord::Base
  VALUES = ['up', 'down']
  attr_accessible :voter_id, :link_id, :vote_value
  
  validates :vote_value, :inclusion => {:in => VALUES}
  validates :link_id, :uniqueness => {
    :scope => :voter_id, 
    :message => "Please vote only once"
  }
  
  belongs_to :link
  belongs_to :voter, 
    :class_name => "User"
end
