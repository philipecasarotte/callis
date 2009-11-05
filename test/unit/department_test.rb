require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  context "A Department" do
    should_have_many :users
    should_validate_presence_of :name
  end
end
