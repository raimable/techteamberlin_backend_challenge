# Mission Controller.
class MissionsController < ApplicationController
  def index
    if params[:nationality_id]
      nationality = Nationality.find_by_id(params[:nationality_id])
      if nationality
        @missions = nationality.missions.uniq
      else
        render json: { success: false, message: 'Nationality not found' }, status: 404
      end
    else
      @missions = Mission.all
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def search
    params.require(:query)

    query = params[:query]
    @missions = Mission.search_by_description(query)
    render 'index'
  end
end
