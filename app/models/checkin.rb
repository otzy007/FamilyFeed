class Checkin < ActiveRecord::Base
  attr_accessible :family_id, :place, :user_id, :user, :family, :post, :longitude, :latitude, :gmaps
  
  belongs_to :user
  belongs_to :post
  belongs_to :family
  
  validates_presence_of :user
  
  acts_as_gmappable

  def gmaps4rails_address
     begin
	where = Gmaps4rails.places latitude, longitude, 'AIzaSyBuvYB3BBl-wa8F8Y4BqMT_Pn4hsSq_2dc', nil, 20
	"#{where[0][:name]}, #{where[0][:full_data]['vicinity'].force_encoding("iso-8859-1")}" 
     rescue Exception
	"somewhere"
     end
  end
  
  def gmaps4rails_infowindow
     "<h4>#{user.name}</h4><br />#{post.text}"
  end

end
