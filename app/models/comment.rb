class Comment < ActiveRecord::Base
  attr_accessible :calendar_id, :post_id, :text, :post, :calendar, :user
  belongs_to :calendar
  belongs_to :post
  belongs_to :user
end
