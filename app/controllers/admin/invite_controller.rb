class Admin::InviteController < ApplicationController
   def new
      @email = params.require :email
   end
   def create
      @email = params.require(:user).require :email
      
      if Invite.find_by_email @email
	 redirect_to :admin_index, :alert => 'User already invited!'
	 return
      end
      invite = current_user.family.invites.create email: @email, user: current_user, token: Digest::MD5.hexdigest(rand.to_s)
      @token = invite.token
   end
end
