	
	json.extract! @mission, :id, :wikipedia, :website, :twitter, :description
	json.mission_id @mission.mission_identifier
	json.mission_name @mission.name

