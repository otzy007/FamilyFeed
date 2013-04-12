class Post < ActiveRecord::Base
  attr_accessible :calendar, :text, :todo, :user_id, :family, :checkin
  belongs_to :user
  has_one :calendar
  has_one :todo
  has_one :checkin
  belongs_to :family
  
  validates_presence_of :text
  validates_presence_of :user
  
end
