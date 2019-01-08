require 'test_helper'

class PayloadTest < ActiveSupport::TestCase
  # Test Create, Read/Load, Update, Delete/Destroy Payload
  
  def test_crud_payload
    # Create Mission
    mission = Mission.new name: 'some name',
                          mission_identifier: 'TEST-1-001',
                          wikipedia: 'missions(:one).wikipedia',
                          website: 'missions(:one).website',
                          twitter: 'missions(:one).twitter',
                          description: 'missions(:one).description'
    assert mission.save

    payload = Payload.new mission: mission,
                          payload_identifier: '201-P-39',
                          reused: 'false',
                          manufacturer: 'test-manufacturer',
                          payload_type: 'test-payload-type',
                          mass_kg: '1.58',
                          mass_lbs: '2.59',
                          orbit: 'test-payload-manufacturer'
    # Test create payload
    assert payload.save

    # Test load payload
    payload_copy = Payload.find(payload.id)
    # Test if the loaded payload is same as exisiting one
    assert_equal payload.payload_identifier, payload_copy.payload_identifier
    # Test update payload
    payload_copy.payload_identifier = 'updated-identifier'

    assert payload_copy.save

    # Test destroy mission - As it destroy even the payload
    assert mission.destroy
  end
end
