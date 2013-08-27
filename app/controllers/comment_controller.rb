class CommentController < ApplicationController
   
   def new
      @post = params.permit([:post])[:post]
      
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
      
      if post
	 current_user.family.posts.find_by_id(post).comments.create :text => comment, :user => current_user
	 redirect_to :feed_index
      else
	 event = params.permit([:event])[:event]
	 comm = current_user.family.calendars.find(event).comments.create :text => comment, :user => current_user
	 current_user.posts.create :text => "<div class='icon-reply'></div>&nbsp;#{comment} <br /><small> on the " +
	       "<a href=#{calendar_path(event) + '#' + comm.id.to_s}>#{Calendar.find(event).title}</a> event</small>", 
	   :family => current_user.family
	 
	 redirect_to calendar_path(event)
      end
   end
end
