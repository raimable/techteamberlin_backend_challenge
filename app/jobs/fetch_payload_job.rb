require 'net/http'
require 'uri'
class FetchPayloadJob < ApplicationJob
  queue_as :default

  retry_on Net::HTTPExceptions
  discard_on JSON::JSONError
  discard_on ActiveRecord::ActiveRecordError


  def perform(*args)
    payload_id = args[0]
    mission    = Mission.find(args[1])

    #https://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html

    Rails.logger.info "Fetching payload #{payload_id}"

  	uri       = URI("https://api.spacexdata.com/v3/payloads/#{URI.encode(payload_id)}")
    raw_data  = Net::HTTP.get(uri)
    payload_json   = JSON.parse(raw_data) 
    
    payload = Payload.new mission: mission , payload_identifier: payload_id

    payload.reused = payload_json['reuse']
    payload.manufacturer = payload_json['manufacturer']
    payload.payload_type = payload_json['payload_type']
    payload.mass_kg = payload_json['payload_mass_kg']
    payload.mass_lbs = payload_json['payload_mass_lbs']
    payload.orbit = payload_json['orbit']

    #For some paylods, nationality name is coming as null. Especially for SpaceX playloads
    nationality_name = payload_json["nationality"]
    nationality 	 = Nationality.find_or_create_by name:payload_json["nationality"] if nationality_name
   
    payload.nationality = nationality

    if payload.save
    	Rails.logger.info "Payload #{payload_id} saved"
    else
    	Rails.logger.info "Failed to save payload #{payload_id} due to #{payload.errors.full_messages}"
    end
  end

end
