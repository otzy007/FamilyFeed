class RegistrationsController < Devise::RegistrationsController
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
end