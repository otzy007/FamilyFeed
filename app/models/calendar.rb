class Calendar < ActiveRecord::Base
  attr_accessible :date, :post_id, :text, :user_id
  belongs_to :user
  belongs_to :post
  
  validates_presence_of :date
  validates_presence_of :user
  validates_presence_of :post
end
