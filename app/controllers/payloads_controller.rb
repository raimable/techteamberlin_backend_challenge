# Payload controller
class PayloadsController < ApplicationController
  def index
    if params[:nationality_id]
      nationality = Nationality.find_by_id(params[:nationality_id])
      if nationality
        @payloads = @payloads.where(nationality_id: params[:nationality_id])
      else
        render json: { success: false, message:
          'Nationality not found' },
               status: 404
      end
    else
      @payloads = Payload.all
    end
  end

  def show
    @payload = Payload.find(params[:id])
  end
end
