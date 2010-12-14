class Event < ActiveRecord::Base
  validates_presence_of :name, :description, :location_id, :starts_at, :ends_at, :event_category_id
  belongs_to :event_category
  belongs_to :location

  def self.upcoming
    find(:all, :conditions => ['ends_at > ?', Time.now.utc], :order => 'starts_at', :limit => 2)
  end
end
