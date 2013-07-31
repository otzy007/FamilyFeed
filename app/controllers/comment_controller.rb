class CommentController < ApplicationController
   
   def new
      @post = params.require [:post]
      respond_to do |format|
	      format.js
	      format.html
      end
   end
   
   def create
      comment = params.require(:feed).require :comment
      post = params.require :post
      p post
      
      current_user.family.posts.find_by_id(post).comments.create :text => comment, :user => current_user
      
      redirect_to :feed_index
   end
end
