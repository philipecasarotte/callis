require 'test_helper'

class ProcedureTest < ActiveSupport::TestCase
  context "A Procedure" do
    should_validate_presence_of :name, :explanation
    should_belong_to :user
    should_belong_to :department
  end
end
