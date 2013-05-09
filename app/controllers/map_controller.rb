class MapController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @json = Checkin.find_all_by_family_id(current_user.family.id).to_gmaps4rails
  end

  def show
     @json = Checkin.find_by_family_id_and_id(current_user.family.id, params[:id]).to_gmaps4rails
     render :index
  end
  def show_all
     user_id = params[:id]
     
     @json = Checkin.find_all_by_family_id_and_user_id(current_user.family.id, user_id).to_gmaps4rails
     render :index
  end
  
  def create
  end
  
  def destroy
  end
end
