require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  setup do
    @controller = PagesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context "Page controller" do

    context "on GET to index" do
      setup do
        get :index
      end

      should_assign_to(:pages) { Page.main_pages }
    end

    context "on GET to show" do
      setup do
        @page = Factory(:page)
        get @page.permalink
      end

      should_assign_to(:page) { Page.find_by_permalink(@page.permalink) }
    end

    context "with children for sidebar" do
      setup do
        get Factory(:about).permalink
      end

      should_assign_to(:pages) { Page.find_by_permalink(Factory(:about).permalink).children }
    end

  end

  context "When a user sends the contact form" do
    setup do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
      Factory.create(:page, :name => 'Contato')
      post :contato, 'contact' => {'name' => "Ricardo", 'email' => "dev.dburns@gmail.com", 'message' => 'Hello!'}
    end

    should "render the contact's template" do
      get "contato"
      assert_template "contato"
    end

    should "send contact e-mail" do
      assert_sent_email do |email|
        email.from.include?('dev.dburns@gmail.com') && email.subject.match(I18n.t(:contact_from))
      end
    end

    should_set_the_flash_to(I18n.t(:message_sent))
  end

  context "Trying to get a page with a existing method" do
    setup do
      PagesController.class_eval do
        def testing
          @testing = 'Testing'
        end

        def it_s_a_joke
          @file_attribute = true
        end
      end
    end

    should "return the @testing value" do
      Factory(:page, :name => 'Testing')

      assert_respond_to(@controller, :testing)

      get 'testing'
      assert_equal "Testing", assigns(:testing)
      assert_template "show"
    end

    should "return the joke" do
      page = Factory(:page, :name => "it-s-a-joke")

      assert_respond_to(@controller, :it_s_a_joke)

      get page.permalink

      assert assigns(:file_attribute)
      assert_template "show"
    end
  end

end
