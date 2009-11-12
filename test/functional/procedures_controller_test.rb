require 'test_helper'

class ProceduresControllerTest < ActionController::TestCase
  setup do
    @controller = ProceduresController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  context "A user accessing" do
    context "the index of Procedures" do
      setup do
        @page = Factory(:page, :name => "Procedureos", :permalink => "procedureos", :body => "Test")
        get :index
      end
      
      should_render_template :index
    end
    
    context "a Procedure" do
      setup do
        @procedure = Factory(:procedure)
        get :show, :id => @procedure.permalink
      end
      
      should_render_template :show
      should_assign_to(:procedure) { Procedure.find_by_permalink(@procedure.permalink) }
    end
  end
end
