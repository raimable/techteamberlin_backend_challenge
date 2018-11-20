# Nationality Controller
class NationalitiesController < ApplicationController
  def index
    @nationalities = Nationality.all
  end

  def show
    nationality = Nationality.find_by_id(params[:id])
    if nationality
      @nationality = nationality
    else
      
      render json: { success: false, message:
          'Nationality not found' },
             status: 404
    end
  end
end
