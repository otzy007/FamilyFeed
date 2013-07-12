class Admin::InviteController < ApplicationController
   def new
      @email = params.require :email
      p @email
   end
end
