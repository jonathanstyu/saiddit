class Sub < ActiveRecord::Base
  attr_accessible :moderator_id, :category, :link_ids, :links_attributes
  
  belongs_to :moderator
  has_many :linksubs
  has_many :links, :through => :linksubs
  
  accepts_nested_attributes_for :links
end
