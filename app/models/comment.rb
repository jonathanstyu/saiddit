class Comment < ActiveRecord::Base
  attr_accessible :text, :commenter_id, :parent_comment_id, :link_id, :title
  
  validates :title, :text, :presence => true 
  
  validates :commenter, :presence => true
  
  belongs_to :commenter, 
    :class_name => "User"
    
  belongs_to :link 
  
  has_many :replies, 
    :foreign_key => :parent_comment_id, 
    :class_name => "Comment", 
    :dependent => :destroy 
    
  belongs_to :replied_to, 
    :class_name => "Comment",
    :foreign_key => :parent_comment_id
  
end
