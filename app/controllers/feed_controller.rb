class FeedController < ApplicationController
   before_filter :authenticate_user!
   
   def index
      @posts = []
      
      if current_user.family.nil?
        redirect_to   :admin_index
        return
      end

	    @posts = current_user.family.posts.order('created_at DESC').page params[:page]

      respond_to do |format|
        format.js
        format.html # index.html.erb
        format.xml  { render :xml => @posts }
      end
   end
   
   def create
      post = params.require(:feed).require(:post)
     
      pos_params = params.require(:feed).permit :longitude, :latitude
      longitude = pos_params[:longitude]
      latitude = pos_params[:latitude]
      
      checkin = nil
      
      if (longitude && longitude != "bau")
	 checkin = Checkin.create :family => current_user.family, :longitude => longitude.to_f, :latitude => latitude.to_f,
	       :gmaps => true, :user => current_user
      end
      
      current_user.posts.create :text => post, :family => current_user.family, :checkin => checkin
      redirect_to :feed_index
   end
end
