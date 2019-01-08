require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  # test " Create, Read, Update delete Mission"true

  def test_crud_mission
    mission = Mission.new name: 'some name',
                          mission_identifier: 'TEST-1-001',
                          wikipedia: 'missions(:one).wikipedia',
                          website: 'missions(:one).website',
                          twitter: 'missions(:one).twitter',
                          description: 'missions(:one).description'
    # Test create mission
    assert mission.save
    # Test load mission
    mission_copy = Mission.find(mission.id)
    # Test if the loaded mission is same as exisiting one
    assert_equal mission.name, mission_copy.name
    # Test update mission
    mission.name = 'Update name'

    assert mission_copy.save
    # Test destroy mission

    assert mission.destroy
  end

  def test_can_not_save_mission_with_no_name
    mission = Mission.new mission_identifier: 'TEST-2-002',
                          wikipedia: 'missions(:two).wikipedia',
                          website: 'missions(:two).website',
                          twitter: 'missions(:two).twitter',
                          description: 'missions(:two).description'
    # Test create mission with no name
    assert_not mission.save
  end
end
