class Checkin < ActiveRecord::Base
  attr_accessible :family_id, :place, :user_id, :user, :family, :post
  
  belongs_to :user
  belongs_to :post
  belongs_to :family
  
  validates_presence_of :user
  validates_presence_of :place
end
