class FeedController < ApplicationController
   before_filter :authenticate_user!
   
   layout 'homepage'
   
   def index
      
   end
   
   def create
      post = params[:feed][:post]
      current_user.posts.create :text => post, :family => current_user.family
      redirect_to :feed_index, :alert => post
   end
end
