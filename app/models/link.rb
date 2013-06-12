class Link < ActiveRecord::Base
  attr_accessible :submitter_id, :text, :url, :title, :sub_ids, :comments_attributes
  
  validates :url, :title, :presence => true
  
  has_many :linksubs
  has_many :subs, :through => :linksubs
  
  belongs_to :submitter, 
    :class_name => "User"
    
  has_many :comments, 
    :foreign_key => :link_id
  # validates :submitter, :presence => true
  
  accepts_nested_attributes_for :comments
end
