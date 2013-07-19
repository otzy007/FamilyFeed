class ApplicationController < ActionController::Base
  before_action :set_locale
 
  def set_locale
     I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
     session[:locale] = params[:locale]
  end
  protect_from_forgery
end
