class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.upcoming

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.ics do
        ical = RiCal.Calendar do |cal|
          @events.each do |event|
            cal.event do |e|
              e.summary     "Philly.rb: #{event.name}"
              e.description event.description
              e.dtstart     event.starts_at.utc.to_datetime
              e.dtend       event.ends_at.utc.to_datetime
              e.location    event.location.name
            end
          end
        end
        render :text => ical.to_s
      end
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def yearly
    @year = params[:year].to_i
    @no_address = true
    @business = EventCategory.find(:first, :conditions => { :name => "Business Meeting" })
    @events = Event.find(:all, :conditions => ["starts_at >= '#{@year}-01-01' AND starts_at < '#{@year + 1}-01-01' AND event_category_id = ?", @business.id])
  end
end
