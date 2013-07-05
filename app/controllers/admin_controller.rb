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
     redirect_to :admin_index, :notice => 'Family created!'
  end
  
  def create
     user_email = params.require(:users).require :email
     puts user_email
     
     user = User.find_by_email user_email
     if user
	unless user.family
	   user.update_attributes :family => current_user.family
	   redirect_to :admin_index, :notice => "User #{user.name} is now in your family"
	else
	   redirect_to :admin_index, :alert => "User #{user.name} is already in a family"
	end
     else
	redirect_to :admin_index, :alert => "No user is registered with #{user_email}. Ask him first to register"
     end
  end
  
  def destroy
     user = User.find_by_id params[:id]
     
     if current_user.family == user.family
	user.update_attributes :family => nil
	redirect_to :admin_index, :alert => "User #{user.name} removed from your family"
     else
	redirect_to :admin_index
     end
  end
end
