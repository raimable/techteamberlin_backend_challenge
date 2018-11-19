require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  mission = Mission.new
  assert_not mission.save
end
