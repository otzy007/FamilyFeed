class CalendarController < ApplicationController
  def index
     @events = current_user.family.calendars
     
     month = params.require(:month).to_i
     year = params.require(:year).to_i
     current_user.family.users.map do |u|
	if u.birth && u.birth.month == month
	   @events << Calendar.create(date: Date.new(year, u.birth.month, u.birth.day), family: current_user.family, title: "#{u.name} birthday")
	end
     end
  end

  def new
  end

  def show
    @event = current_user.family.calendars.find_by_id params.require(:id)

    if @event.nil?
      redirect_to :calendar_index
      return
    end
  end

  def edit
     @calendar = Calendar.find_by_id params.require(:id)
  end
  
  def update
     calendar = params.require(:calendar).permit :title, :text, :date
     event_time = DateTime.new calendar['date(1i)'].to_i, calendar['date(2i)'].to_i, calendar['date(3i)'].to_i,
                        calendar['date(4i)'].to_i, calendar['date(5i)'].to_i
     
     @calendar = Calendar.find_by_id params.require(:id)
     @calendar.text = calendar[:text]
     @calendar.title = calendar[:title]
     @calendar.date = event_time
     @calendar.save
     
     current_user.posts.create :text => "<div class='icon-calendar'></div>&nbsp;<small>#{current_user.name} modified <b><a href='/calendar/#{@calendar.id}'>#{calendar[:title]}</a></b> on #{event_time} to the <a href='/calendar'>Calendar</a></small>",
                              :family => current_user.family, :calendar => @calendar
     
     redirect_to calendar_path(@calendar)
  end
  
  def create
    calendar = params.require(:calendar).permit :title, :text, :date
    event_time = DateTime.new calendar['date(1i)'].to_i, calendar['date(2i)'].to_i, calendar['date(3i)'].to_i,
                        calendar['date(4i)'].to_i, calendar['date(5i)'].to_i

    event = current_user.calendars.create :title =>  calendar[:title], :text => calendar[:text], :family => current_user.family,
                                        :date => event_time

    current_user.posts.create :text => "<div class='icon-calendar'></div>&nbsp;<small>#{current_user.name} added <b><a href='/calendar/#{event.id}'>#{calendar[:title]}</a></b> on #{event_time} to the <a href='/calendar'>Calendar</a></small>",
                              :family => current_user.family, :calendar => event
    redirect_to :calendar_index
  end
  
  def destroy
     event = Calendar.destroy params.require(:id)
     
     redirect_to :calendar_index
  end
end
