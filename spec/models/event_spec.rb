require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  it "should require a name" do
    Event.new(valid_event_attributes.except(:name)).should_not be_valid
  end

  it "should require a description" do
    Event.new(valid_event_attributes.except(:description)).should_not be_valid
  end

  it "should require a location" do
    Event.new(valid_event_attributes.except(:location_id)).should_not be_valid
  end

  it "should require a start date/time" do
    Event.new(valid_event_attributes.except(:starts_at)).should_not be_valid
  end

  it "should require an end date/time" do
    Event.new(valid_event_attributes.except(:ends_at)).should_not be_valid
  end

  it "should require a category" do
    Event.new(valid_event_attributes.except(:event_category_id)).should_not be_valid
  end
end

describe "Event#upcoming" do
  it "should return only events that haven't ended" do
    Event.create(valid_event_attributes(:starts_at => Time.now+1000, :ends_at => Time.now+2000)) # hasn't started, should show
    Event.create(valid_event_attributes(:starts_at => Time.now-1000, :ends_at => Time.now+1000)) # started, not over, should show
    Event.create(valid_event_attributes(:starts_at => Time.now-1000, :ends_at => Time.now-500))  # over, shouldn't show
    Event.upcoming.size.should eql(2)
  end
end
