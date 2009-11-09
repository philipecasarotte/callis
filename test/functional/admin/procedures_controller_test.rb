require 'test_helper'

class Admin::ProceduresControllerTest < ActionController::TestCase

  setup do
    @controller = Admin::ProceduresController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context 'logged as admin' do
    setup do
      activate_authlogic
      UserSession.create(Factory(:admin))
      Factory(:procedure)
    end
    
    context 'and get the index' do
      setup do
        get :index
      end

      should_render_template :index
    end

    context "accessing the form for new Procedure" do
      setup do
        get :new
      end
      should_render_template :new
    end

    context "Create" do
      context "an invalid Procedure" do
        setup do
          Procedure.any_instance.stubs(:valid?).returns(false)
          post :create
        end
        should_render_template :new
      end

      context "a valid Procedure" do
        setup do
          Procedure.any_instance.stubs(:valid?).returns(true)
          post :create
        end
        should_redirect_to("list of Procedure") { admin_procedures_path }
      end
    end

    context 'and get the edit page' do
      setup do
        get :edit, :id => Factory(:procedure)
      end
      should_render_template :edit
    end

    context 'and update a Procedure' do
      setup do
        @procedure = Factory(:procedure)
      end

      context 'with valid data' do
        setup do
          Procedure.any_instance.stubs(:valid?).returns(true)
          put :update, :id => @procedure
        end
        should_redirect_to('list of Procedures'){ admin_procedures_url }
      end

      context 'with invalid data' do
        setup do
          Procedure.any_instance.stubs(:valid?).returns(false)
          put :update, :id => @procedure
        end
        should_render_template :edit
      end
    end
  end
end

