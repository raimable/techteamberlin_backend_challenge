# Payload controller
class PayloadsController < ApplicationController
  def index
    @payloads = Payload.all
    @payloads = @payloads.where(nationality_id: params[:nationality_id]) if params[:nationality_id]
  end

  def show
    @payload = Payload.find(params[:id])
  end
end
