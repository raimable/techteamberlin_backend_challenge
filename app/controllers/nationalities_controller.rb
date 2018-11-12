class NationalitiesController < ApplicationController
	def index
		@nationalities = Nationality.all
	end

	def show
		@nationality = Nationality.find(params[:id])
	end
end
