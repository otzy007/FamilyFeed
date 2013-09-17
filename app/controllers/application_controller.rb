class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_timezone
  
  def set_timezone
    if current_user.nil?
      Time.zone = 'Eastern Time (US & Canada)'
    else
      Time.zone = current_user.timezone || 'Eastern Time (US & Canada)'
    end
  end
end
