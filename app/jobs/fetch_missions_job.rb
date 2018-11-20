require 'net/http'
# Fetch Mission ActiveJob
class FetchMissionsJob < ApplicationJob
  queue_as :default

  retry_on Net::HTTPExceptions # 5 times, 3 seconds apart
  discard_on JSON::JSONError
  discard_on ActiveRecord::ActiveRecordError

  def perform(*args)
    # Do something later
    sync = args[0] if args
    fetch_missions(sync)
  end

  def fetch_missions(sync = false)
    # https://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html

    Rails.logger.info 'Mission Fetch Job Starts.'

    uri = URI(Rails.application.config.x.space_x_api_missions_url)
    missions = Net::HTTP.get(uri)
    json_data = JSON.parse(missions)

    error_count = 0

    json_data.each do |mission_data|
      # Check if the mission is already there by mission_id to avoid deplicate
      mission_identifier = mission_data['mission_id']
      Mission.find_or_create_by mission_identifier:
      mission_identifier do |mission|
        mission.name = mission_data['mission_name']
        mission.mission_identifier = mission_data['mission_id']
        mission.wikipedia = mission_data['wikipedia']
        mission.website = mission_data['website']
        mission.twitter = mission_data['twitter']
        mission.description = mission_data['description']

        error_count += 1 unless mission.save

        mission_data['payload_ids'].each do |payload_id|
          if sync == true
            # Fetch Payload that have missions syncroniously
            FetchPayloadJob.perform_now(payload_id, mission.id)

          else
            # Fetch Payload that have missions asyncroniously
            FetchPayloadJob.perform_later(payload_id, mission.id)

          end
        end
      end
    end
    Rails.logger.info "Mission Fetch Job Completed. #{error_count}
    errors out of #{json_data.count}"

    # Fetch payloads that were not fetched from missions
    if sync == true
      # Fetch remaining Payloads that have no missions syncroniously
      FetchAllPayloadsJob.perform_now
    else
      # Fetch remaining Payloads that have no missions asyncroniously
      FetchAllPayloadsJob.perform_later
    end
  end
end
