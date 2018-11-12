class MissionsController < ApplicationController

	def index
		@missions = Mission.all
		render 
	end

	def show 
		@mission = Mission.find(params[:id])
	end  
end
