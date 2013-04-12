class Calendar < ActiveRecord::Base
  attr_accessible :date, :post_id, :text, :user_id, :user, :family
  belongs_to :user
  belongs_to :post
  
  validates_presence_of :date
  validates_presence_of :user
  validates_presence_of :family
#   validates_presence_of :post
end
