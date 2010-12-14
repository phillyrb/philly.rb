class PageController < ApplicationController
  def year_2010
    @business = EventCategory.find(:first, :conditions => { :name => "Business Meeting" })
    @events = Event.find(:all, :conditions => ["starts_at >= '2010-01-01' AND starts_at < '2011-01-01' AND event_category_id = ?", @business.id])
  end
end
