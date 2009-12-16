class EventsController < ApplicationController
  
  before_filter :require_user
  
  #after_filter {|c| c.cache_page}
  
  def index
    @events = Event.upcoming
    get_page
  end
  
  def arquivo
    @events = Event.past
    get_page
  end
  
  def show
    @event = Event.find_by_permalink(params[:id])
    @metatag_object = @event
  end
  
  def get_page
    @page = Page.find_by_permalink("eventos")
    @metatag_object = @page
  end
end
