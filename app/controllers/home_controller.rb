# Landing page.
class HomeController < ApplicationController
  def fetch_all
    if params[:sync] == 'true'
      FetchMissionsJob.perform_now true
      render json: { success: true, sync: true, message: 'All data fetched' }
    else
      FetchMissionsJob.perform_later false
      render json: {
        success: true, sync: false,
        message: 'A data fetch is scheduled'
      }
    end
  end

  def info
    render json: {
      total_payloads_in_db: Payload.count,
      unique_payload_identifiers: Payload.all.select('payload_identifier').collect(&:payload_identifier).uniq.count,
      payloads_without_a_mission: Payload.where(mission: nil).count,
      total_missions: Mission.count,
      total_nationalities: Nationality.count
    }
  end
end
