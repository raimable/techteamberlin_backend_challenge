json.extract! @payload, :id, :reused, :manufacturer,
              :payload_type, :mass_kg, :mass_lbs, :orbit
json.payload_id @payload.payload_identifier
