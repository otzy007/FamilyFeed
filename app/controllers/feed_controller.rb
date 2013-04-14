class FeedController < ApplicationController
   before_filter :authenticate_user!
   
   def index
      @posts = []
      
      if current_user.family
	 current_user.family.posts.collect do |p|
	    @posts << {:user => p.user, :text => p.text, :date => p.created_at,
	               :comments => p.comments, :id => p.id}
	 end
      else
	 current_user.posts.collect do |u|
	    @posts << {:user => p.user, :text => p.text, :date => p.created_at,
	               :comments => p.comments, :id => p.id}
	 end
      end
   end
   
   def create
      post = params[:feed][:post]
      current_user.posts.create :text => post, :family => current_user.family
      redirect_to :feed_index
   end
end
