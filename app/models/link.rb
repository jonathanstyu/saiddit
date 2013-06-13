class Link < ActiveRecord::Base
  attr_accessible :submitter_id, :text, :url, :title, :sub_ids, :comments_attributes
  
  validates :url, :title, :presence => true
  
  has_many :linksubs
  has_many :subs, :through => :linksubs
  
  belongs_to :submitter, 
    :class_name => "User"
    
  has_many :comments, 
    :foreign_key => :link_id, 
    :dependent => :destroy 
    
  validates :submitter, :presence => true
  
  has_many :votes,
    :class_name => "UserVote"
  
  accepts_nested_attributes_for :comments, :reject_if => :missing_text_title
  
  def missing_text_title(attributes)
    attributes['title'].blank? || attributes['text'].blank?
  end
  
end
