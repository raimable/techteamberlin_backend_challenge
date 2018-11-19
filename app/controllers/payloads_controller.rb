# Payload controller
class PayloadsController < ApplicationController
  def index
    @payloads = Payload.all
    if params[:nationality_id]
      @payloads = @payloads.where(nationality_id: params[:nationality_id])
    end
  end

  def show
    @payload = Payload.find(params[:id])
  end
end
