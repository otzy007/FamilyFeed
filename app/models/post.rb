class Post < ActiveRecord::Base
  attr_accessible :calendar_id, :text, :todo_id, :user_id
  belongs_to :user
  has_one :calendar
  has_one :todo
  
  validates_presence_of :text
  validates_presence_of :user
end
