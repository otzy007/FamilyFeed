class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :family
  
  has_one :calendar
  has_one :todo
  has_one :checkin
  
  has_many :comments
  
  validates_presence_of :text
  validates_presence_of :user
  
end
