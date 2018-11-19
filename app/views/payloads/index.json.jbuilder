json.array! @payloads do |payload|
  json.extract! payload, :id, :reused, :manufacturer, :payload_type, :orbit
  json.payload_id payload.payload_identifier
  json.payload_mass_kg payload.mass_kg
  json.payload_mass_lbs payload.mass_lbs
end
