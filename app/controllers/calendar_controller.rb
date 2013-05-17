class CalendarController < ApplicationController
  def index
     @events = current_user.family.calendars
  end

  def new
  end

  def edit
  end
  
  def update
     
  end
  
  def create
     
  end
  
  def destroy
     
  end
end
