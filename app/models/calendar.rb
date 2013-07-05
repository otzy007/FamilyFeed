class Calendar < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :family
  
  has_many :comments
  
  validates_presence_of :date
  validates_presence_of :user
  validates_presence_of :family


#   validates_presence_of :post
  
  def start_time
     date
  end
end
