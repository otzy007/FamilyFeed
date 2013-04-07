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
     current_user.update_attributes({:family => family}, :without_protection => true)
     redirect_to :admin_index, :notice => 'Family created!'
  end
  
  def create
     user_email = params[:users][:email]
     puts user_email
     
     user = User.find_by_email user_email
     if user
	unless user.family
	   user.update_attributes({:family => current_user.family}, :without_protection => true)
	   redirect_to :admin_index, :notice => "User #{user.name} is now in your family"
	else
	   redirect_to :admin_index, :alert => "User #{user.name} is already in a family"
	end
     else
	redirect_to :admin_index, :alert => "No user is registered with #{user_email}. Ask him first to register"
     end
  end
end
