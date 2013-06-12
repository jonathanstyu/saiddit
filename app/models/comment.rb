class Comment < ActiveRecord::Base
  attr_accessible :text, :commenter_id, :parent_comment_id, :link_id
  
  belongs_to :commenter, 
    :class_name => "User"
    
  belongs_to :link 
end
