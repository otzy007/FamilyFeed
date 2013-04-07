class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @family = current_user.family
  end
  
  def new
     family = Family.create!
     new_family = family.id
     current_user.update_attributes({:family => family}, :without_protection => true)
     render :text => new_family
  end
end
