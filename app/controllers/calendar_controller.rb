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
    calendar = params[:calendar]
    event_time = DateTime.new calendar['date(1i)'].to_i, calendar['date(2i)'].to_i, calendar['date(3i)'].to_i,
                        calendar['date(4i)'].to_i, calendar['date(5i)'].to_i

    event = current_user.calendars.create :title =>  calendar[:title], :text => calendar[:text], :family => current_user.family,
                                        :date => event_time

    current_user.posts.create :text => "<div class='icon-tasks'></div>&nbsp;<small>#{current_user.name} added <b><a href='/calendar/#{event.id}'>#{calendar[:title]}</a></b> on #{event_time} to the <a href='/calendar'>Calendar</a></small>",
                              :family => current_user.family, :calendar => event
    redirect_to :calendar_index
  end
  
  def destroy
     
  end
end
