class PayloadsController < ApplicationController

	def index
		@payloads = Payload.all 
	end

	def show 
		@payload= Payload.find(params[:id])
	end  
end
