class FeedController < ApplicationController
   before_filter :authenticate_user!
   
   def index
      @posts = []
      
      if current_user.family
	 @posts = current_user.family.posts.order('created_at DESC').page params[:page]
# 	 current_user.family.posts.order('created_at DESC').each do |p|
# 	    @posts << {:user => p.user, :text => p.text, :date => p.created_at,
# 	               :comments => p.comments, :id => p.id, :checkin => p.checkin}
# 	 end
      else
	 @posts = current_user.posts.order('created_at DESC') #.each do |u|
# 	    @posts << {:user => p.user, :text => p.text, :date => p.created_at,
# 	               :comments => p.comments, :id => p.id, :checkin => p.checkin}
# 	 end
      end
   end
   
   def create
      post = params[:feed][:post]
      longitude = params[:feed][:longitude]
      latitude = params[:feed][:latitude]
      
      checkin = nil
      checkin = Checkin.create :family => current_user.family, :longitude => longitude.to_f, :latitude => latitude.to_f,
	    :gmaps => true, :user => current_user if longitude
      
      current_user.posts.create :text => post, :family => current_user.family, :checkin => checkin
      redirect_to :feed_index
   end
end
