class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def can_administer?
     if current_user && (current_user.email == 'andrei@cloudients.com' || current_user.email == 'bogdan@cloudients.com')
	true
     else
	false
     end
  end
end
