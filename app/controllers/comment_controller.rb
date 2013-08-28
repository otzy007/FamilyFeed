class CommentController < ApplicationController
   
   def new
      @post = params.permit([:post])[:post]
      p @post
      respond_to do |format|
	      format.js
	      format.html
      end
   end
   
   def create
      begin
	 comment = params.require(:feed).require :comment
	 post = params.permit([:post])[:post]
      rescue ActionController::ParameterMissing
	 redirect_to :feed_index, :alert => 'The comment should contain a message'
	 return
     end
      
      current_user.family.posts.find_by_id(post).comments.create :text => comment, :user => current_user
      
      redirect_to :feed_index
   end
end
