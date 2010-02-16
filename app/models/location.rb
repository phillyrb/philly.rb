class Location < ActiveRecord::Base
  
  validates_presence_of :name, :address_1, :city, :state, :zip
  has_many :events

  def map_query
    read_attribute(:map_query) || "#{address_1} #{zip}"
  end

  def map_url
    "http://maps.google.com/maps?q=" + CGI.escape(map_query)
  end

  def image_url
    "http://maps.google.com/maps/api/staticmap?markers=color:red|label:B|" +
      CGI.escape(map_query) + "&size=240x200&sensor=false&zoom=#{zoom}" +
      "&key=#{APP_CONFIG[:gmap_key]}"
  end

  def zoom
    read_attribute(:zoom) || 16
  end
end
