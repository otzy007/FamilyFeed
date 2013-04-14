class CommentController < ApplicationController
   
   def new
      @post = params[:post]
      respond_to do |format|
	 format.js
	 format.html
      end
   end
   
   def create
      comment = params[:feed][:comment]
      post = params[:post]
      p post
      
      current_user.posts.find_by_id(post).comments.create :text => comment, :user => current_user
      
      redirect_to :feed_index
   end
end
