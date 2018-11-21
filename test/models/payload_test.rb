require 'test_helper'

class PayloadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_the_truth
    mission = Mission.new name: 'some name',
                          mission_identifier: 'TEST-1-001',
                          wikipedia: 'missions(:one).wikipedia',
                          website: 'missions(:one).website',
                          twitter: 'missions(:one).twitter',
                          description: 'missions(:one).description'
    assert mission.save
    
    payload = Payload.new mission: mission,
                          payload_identifier: 'MyString',
                          reused: false,
                          manufacturer: 'MyString',
                          payload_type: 'MyString',
                          mass_kg: 1.5,
                          mass_lbs: 1.5,
                          orbit: 'MyString'
    # Test create payload
    assert payload.save
    # Test load payload
    payload_copy = Payload.find(payload.id)
    # Test if the loaded payload is same as exisiting one
    assert_equal mission.payload_identifier, payload_copy.name
    # Test update payload
    payload_copy.payload_identifier = 'updated-identifier'

    assert payload_copy.save

    # Test destroy mission
    assert payload.destroy
  end
end
