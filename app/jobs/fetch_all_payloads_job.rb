require 'net/http'
require 'uri'
# Fetch Payloads ActiveJob
class FetchAllPayloadsJob < ApplicationJob
  # queue_as :default

  retry_on Net::HTTPExceptions # 5 times, 3 seconds apart
  discard_on JSON::JSONError
  discard_on ActiveRecord::ActiveRecordError

  def perform
    # https://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html

    Rails.logger.info 'Fetching All payload'

    uri = URI(Rails.application.config.x.space_x_api_payloads_url.to_s)
    missions = Net::HTTP.get(uri)
    json_data = JSON.parse(missions)

    json_data.each do |payload_data|
      # Check if the payload is already there by payload_id to avoid deplicate
      payload_id = payload_data['payload_id']

      Payload.find_or_create_by payload_identifier: payload_id do |payload|
        payload.reused = payload_data['reuse']
        payload.manufacturer = payload_data['manufacturer']
        payload.payload_type = payload_data['payload_type']
        payload.mass_kg = payload_data['payload_mass_kg']
        payload.mass_lbs = payload_data['payload_mass_lbs']
        payload.orbit = payload_data['orbit']

        # For some paylods, nationality name is coming as null.
        # Especially for SpaceX playloads

        nationality_name = payload_data['nationality']
        if nationality_name
          nationality = Nationality.find_or_create_by name:
            payload_data['nationality']
        end

        payload.nationality = nationality

        if payload.save
          Rails.logger.info "Payload #{payload_id} saved"
        else
          Rails.logger.info "Failed to save payload #{payload_id} due to
        #{payload.errors.full_messages}"
        end
      end
    end
  end
end
