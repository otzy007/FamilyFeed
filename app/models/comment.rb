class Comment < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :post
  belongs_to :user
end
