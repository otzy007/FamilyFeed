class RegistrationsController < Devise::RegistrationsController
   before_filter :update_sanitized_params, if: :devise_controller?
   def new
      @invitation = params.permit(:invitation)[:invitation]
      super
   end
   
   def create
      super
      pars = params.require(:user).permit(:invitation, :email)
      @invitation = pars[:invitation]
      if @invitation
	 invite = Invite.find_by_token(@invitation)
	 if invite && invite.email == pars[:email]
	    u = User.find_by_email invite.email
	    u.family = invite.family
	    u.save!
	 end
      end
   end
   
   def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) do
	  |u| u.permit(:name, :email, :password, :password_confirmation, :birth)
       end
       
       devise_parameter_sanitizer.for(:account_update) do |u| 
	  u.permit(:name, :email, :password, :password_confirmation, :current_password, :birth)
       end
    end
end