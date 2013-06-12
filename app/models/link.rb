class Link < ActiveRecord::Base
  attr_accessible :submitter_id, :text, :url, :title
  has_many :linksubs
  has_many :subs, :through => :linksubs
  
  belongs_to :submitter, 
    :class_name => "User"
end
