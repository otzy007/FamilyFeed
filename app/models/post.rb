class Post < ActiveRecord::Base
  attr_accessible :calendar, :text, :todo, :user_id, :family
  belongs_to :user
  has_one :calendar
  has_one :todo
  belongs_to :family
  
  validates_presence_of :text
  validates_presence_of :user
  validates_presence_of :family
end
