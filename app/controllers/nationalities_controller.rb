# Nationality Controller
class NationalitiesController < ApplicationController
  before_action :load_nationality, except: [:index]

  def index
    @nationalities = Nationality.all
  end

  def show
    nationality = Nationality.find_by_id(params[:id])
    # if nationality
    @nationality = nationality
  end

  def load_nationality
    nationality = Nationality.find_by_id(params[:id])

    unless nationality.present?
      render json: { success: false, message:
      'Nationality not found' },
        status: 404
    end
  end
end
