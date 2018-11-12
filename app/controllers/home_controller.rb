class HomeController < ApplicationController

	def fetch_all
		if params[:sync]=="true"
			FetchMissionsJob.perform_now true
			render json:{success:true, sync:true,message:"All data fetched"} 
		else
			FetchMissionsJob.perform_later false
			render json:{success:true,sync:false,message:"A data fetch is scheduled"}
		end
	end 
end
