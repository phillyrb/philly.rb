ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'events', :action => 'index'

  map.resources :locations
  map.resources :event_categories
  map.resources :events

  map.namespace :admin do |admin|
    admin.root :controller => 'locations'
    admin.resources :locations
    admin.resources :event_categories
    admin.resources :events, :member => { :copy => :post }
  end

  map.yearly ':year', :controller => 'events', :action => 'yearly', :conditions => { :year => /\d{4}/ }
end
