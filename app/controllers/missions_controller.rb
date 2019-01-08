# Mission Controller.
class MissionsController < ApplicationController
  before_action :load_mission, except: [:index]

  def index
    if params[:nationality_id]
      nationality = Nationality.find_by_id(params[:nationality_id])
      @missions = nationality.missions.uniq

    else
      @missions = Mission.all
    end
  end

  def show
    mission = Mission.find_by_id(params[:id])
    @mission = mission
  end

  def search
    params.require(:query)
    query = params[:query]
    @missions = Mission.search_by_description(query)
    render 'index'
  end

  def load_mission
    mission = Mission.find_by_id(params[:id])

    unless mission.present?

      render json: { success: false, message:
      'Mission not found' },
             status: 404
    end
  end
end
