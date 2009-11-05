require 'test_helper'

class EventTest < ActiveSupport::TestCase
  context "An Event" do
    should_validate_presence_of :name, :body, :happens_on
    should_have_named_scope :upcoming
    should_have_named_scope :past

    should "have a permalink when saved" do
      event = Event.create(:name => "Title of Permalink", :happens_on => Date.tomorrow)
      assert_equal("title-of-permalink", event.permalink)
    end
  end
end
