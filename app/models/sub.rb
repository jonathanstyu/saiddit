class Sub < ActiveRecord::Base
  attr_accessible :moderator_id, :category, :link_ids, :links_attributes
  
  belongs_to :moderator, :class_name => "User"
  has_many :linksubs
  has_many :links, :through => :linksubs
  
  accepts_nested_attributes_for :links, :reject_if => :title_url_blank
  
  # All blank is something that is already used by Rails 
  def title_url_blank(attributed)
    attributed['title'].blank? || attributed['url'].blank?
  end
end
