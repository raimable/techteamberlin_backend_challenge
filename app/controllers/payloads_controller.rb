# Payload controller
class PayloadsController < ApplicationController
  def index
    if params[:nationality_id]
      nationality = Nationality.find_by_id(params[:nationality_id])
      if nationality
        @payloads = Payload.where(nationality_id: params[:nationality_id])
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
    payload = Payload.find_by_id(params[:id])
    if payload
      @payload = payload
    else
      render json: { success: false, message:
      'Payload not found' },
             status: 404
    end
  end
end
