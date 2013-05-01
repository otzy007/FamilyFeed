class Checkin < ActiveRecord::Base
  attr_accessible :family_id, :place, :user_id, :user, :family, :post, :longitude, :latitude, :gmaps
  
  belongs_to :user
  belongs_to :post
  belongs_to :family
  
  validates_presence_of :user
  
  acts_as_gmappable

  def gmaps4rails_address
     "#{self.street}, #{self.city}, #{self.country}" 
  end
  
  def gmaps4rails_infowindow
     "<h4>#{user.name}</h4><br />#{post.text}"
  end

end
