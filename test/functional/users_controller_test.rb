require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @controller = UsersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  
  context "A user accessing" do
    context "the index of Users" do
      setup do
        @page = Factory(:page, :name => "Aniversáriantes", :permalink => "aniversariantes", :body => "Test")
        get :index
      end
      
      should_render_template :index
    end
    
    context "a User" do
      setup do
        @user = Factory(:user)
        get :show, :id => @user.id
      end
      
      should_render_template :show
      should_assign_to(:user) { User.find(@user.id) }
    end
  end
end
