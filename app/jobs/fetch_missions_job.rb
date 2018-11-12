require 'net/http'
class FetchMissionsJob < ApplicationJob
  queue_as :default

  
  retry_on Net::HTTPExceptions
  discard_on JSON::JSONError, ActiveRecord::ActiveRecordError

  def perform(*args)
    # Do something later
    sync = args[0] if args
    fetch_missions(sync)
  end

  def fetch_missions(sync=false)

  	#https://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html

    Rails.logger.info "Mission Fetch Job Starts."

  	uri = URI('https://api.spacexdata.com/v3/missions')
    missions = Net::HTTP.get(uri)
    json_data    = JSON.parse(missions) 
    
    error_count = 0

    json_data.each do |mission_data|

    	mission = Mission.new

    	mission.name = mission_data["mission_name"]
    	mission.mission_identifier = mission_data["mission_id"]
    	mission.wikipedia = mission_data["wikipedia"]
    	mission.website = mission_data["website"]
    	mission.twitter = mission_data["twitter"]
    	mission.description = mission_data["description"]

        error_count = error_count+1	unless mission.save

        mission_data["payload_ids"].each do |payload_id|
        	if sync == true
        		FetchPayloadJob.perform_now(payload_id,mission.id)
        	else
        		FetchPayloadJob.perform_later(payload_id,mission.id)

        	end
        end
    end 
    Rails.logger.info "Mission Fetch Job Completed. #{error_count} errors out of #{json_data.count}"
  end 

end
