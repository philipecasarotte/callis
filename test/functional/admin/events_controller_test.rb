require 'test_helper'

class Admin::EventsControllerTest < ActionController::TestCase

  setup do
    @controller = Admin::EventsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context 'logged as admin' do
    setup do
      activate_authlogic
      UserSession.create(Factory(:admin))
      Factory(:event)
    end
    
    context 'and get the index' do
      setup do
        get :index
      end

      should_render_template :index
    end

    context "accessing the form for new Event" do
      setup do
        get :new
      end
      should_render_template :new
    end

    context "Create" do
      context "an invalid Event" do
        setup do
          Event.any_instance.stubs(:valid?).returns(false)
          post :create
        end
        should_render_template :new
      end

      context "a valid Event" do
        setup do
          Event.any_instance.stubs(:valid?).returns(true)
          post :create
        end
        should_redirect_to("list of Event") { admin_events_path }
      end
    end

    context 'and get the edit page' do
      setup do
        get :edit, :id => Factory(:event)
      end
      should_render_template :edit
    end

    context 'and update a Event' do
      setup do
        @event = Factory(:event)
      end

      context 'with valid data' do
        setup do
          Event.any_instance.stubs(:valid?).returns(true)
          put :update, :id => @event
        end
        should_redirect_to('list of Events'){ admin_events_url }
      end

      context 'with invalid data' do
        setup do
          Event.any_instance.stubs(:valid?).returns(false)
          put :update, :id => @event
        end
        should_render_template :edit
      end
    end
  end
end

