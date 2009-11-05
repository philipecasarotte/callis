require 'test_helper'

class Admin::DepartmentsControllerTest < ActionController::TestCase

  setup do
    @controller = Admin::DepartmentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context 'logged as admin' do
    setup do
      activate_authlogic
      UserSession.create(Factory(:admin))
      Factory(:department)
    end
    
    context 'and get the index' do
      setup do
        get :index
      end

      should_render_template :index
    end

    context "accessing the form for new Department" do
      setup do
        get :new
      end
      should_render_template :new
    end

    context "Create" do
      context "an invalid Department" do
        setup do
          Department.any_instance.stubs(:valid?).returns(false)
          post :create
        end
        should_render_template :new
      end

      context "a valid Department" do
        setup do
          Department.any_instance.stubs(:valid?).returns(true)
          post :create
        end
        should_redirect_to("list of Department") { admin_departments_path }
      end
    end

    context 'and get the edit page' do
      setup do
        get :edit, :id => Factory(:department)
      end
      should_render_template :edit
    end

    context 'and update a Department' do
      setup do
        @department = Factory(:department)
      end

      context 'with valid data' do
        setup do
          Department.any_instance.stubs(:valid?).returns(true)
          put :update, :id => @department
        end
        should_redirect_to('list of Departments'){ admin_departments_url }
      end

      context 'with invalid data' do
        setup do
          Department.any_instance.stubs(:valid?).returns(false)
          put :update, :id => @department
        end
        should_render_template :edit
      end
    end
  end
end

