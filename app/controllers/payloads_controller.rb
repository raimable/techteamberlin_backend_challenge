# Payload controller
class PayloadsController < ApplicationController
  before_action :load_payload, except: [:index]

  def index
    if params[:nationality_id]
      nationality = Nationality.find_by_id(params[:nationality_id])
      if nationality
        @payloads = Payload.where(nationality_id: params[:nationality_id])

      end
    else
      @payloads = Payload.all
    end
  end

  def show
    @payload = Payload.find_by_id(params[:id])
  end

  def load_payload
    payload = Payload.find_by_id(params[:id])
    unless payload.present?

      render json: { success: false, message:
      'Payload not found' },
             status: 404
    end
  end
end
