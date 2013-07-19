class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @family = current_user.family
     
     if @family
	@users = @family.users
     end
  end
  
  def show
     family = Family.create!
     new_family = family.id
     current_user.update_attributes :family => family
     redirect_to :admin_index, :notice => t('.family_created')
  end
  
  def create
     user_email = params.require(:users).require :email
     puts user_email
     
     user = User.find_by_email user_email
     if user
	unless user.family
	   user.update_attributes :family => current_user.family
	   redirect_to :admin_index, :notice => t('.user_now_in_family', name: user.name)
	else
	   redirect_to :admin_index, :alert => t('.user_already_in_family', name: user.name)
	end
     else
	redirect_to :admin_index, :alert => t('.no_user_registered', email: user_email)
     end
  end
  
  def destroy
     user = User.find_by_id params[:id]
     
     if current_user.family == user.family
	user.update_attributes :family => nil
	redirect_to :admin_index, :alert => t('.user_removed', name: user.name)
     else
	redirect_to :admin_index
     end
  end
end
