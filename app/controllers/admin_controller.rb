class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @family = current_user.family
     
     if @family
	@users = @family.users
     end
  end
  
  def new
     family = Family.create!
     new_family = family.id
     current_user.update_attributes({:family => family}, :without_protection => true)
     redirect_to :admin_index, :alert => 'Family created!'
  end
end
