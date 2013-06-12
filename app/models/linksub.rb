class Linksub < ActiveRecord::Base
  attr_accessible :link_id, :sub_id
  
  belongs_to :sub
  belongs_to :link
end
