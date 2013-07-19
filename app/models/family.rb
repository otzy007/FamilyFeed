class Family < ActiveRecord::Base
  has_many :users
  has_many :posts
  has_many :calendars
  has_many :todos
  has_many :checkins
  has_many :invites
end
