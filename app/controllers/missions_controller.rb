class MissionsController < ApplicationController

  def index
    if params[:nationality_id]
      @missions = Nationality.find(params[:nationality_id]).missions.uniq
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
