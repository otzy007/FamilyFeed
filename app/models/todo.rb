class Todo < ActiveRecord::Base
  attr_accessible :post_id, :status, :text, :type, :user_id, :user, :family
  belongs_to :user
  belongs_to :post
  
#   validates_presence_of :post
  validates_presence_of :user
  validates_presence_of :type
  validates_presence_of :text
  validates_presence_of :status
  validates_presence_of :family
end
