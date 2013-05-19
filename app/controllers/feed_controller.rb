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
      post = params[:feed][:post]
      longitude = params[:feed][:longitude]
      latitude = params[:feed][:latitude]
      
      checkin = nil
      checkin = Checkin.create :family => current_user.family, :longitude => longitude.to_f, :latitude => latitude.to_f,
	    :gmaps => true, :user => current_user if (longitude && longitude != 'bau')
      
      current_user.posts.create :text => post, :family => current_user.family, :checkin => checkin
      redirect_to :feed_index
   end
end
