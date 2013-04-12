class FeedController < ApplicationController
   before_filter :authenticate_user!
   
   layout 'homepage'
   
   def index
      
   end
end
