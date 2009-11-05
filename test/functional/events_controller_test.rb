require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @controller = EventsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  context "A user accessing" do
    context "the index of Events" do
      setup do
        @page = Factory(:page, :name => "Eventos", :permalink => "eventos", :body => "Test")
        get :index
      end
      
      should_render_template :index
    end
    
    context "a Event" do
      setup do
        @event = Factory(:event)
        get :show, :id => @event.permalink
      end
      
      should_render_template :show
      should_assign_to(:event) { Event.find_by_permalink(@event.permalink) }
    end
  end
end
