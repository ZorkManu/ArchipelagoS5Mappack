createQuestReachCleycourt = function()
	local quest = {}

	quest.TargetName 	= "Cleycourt_DoorPoint1"		
	quest.Distance 		= 1000			
	quest.Callback 		= CleycourtDoorPointReachedCallback
	quest.Heroes			= 1
	quest.Leaders			= 1
	quest.Serfs			= 1

	SetupExpedition(quest)
	
	local quest2 = {}
	quest2.TargetName 	= "Cleycourt_DoorPoint2"		
	quest2.Distance 		= 1000			
	quest2.Callback 		= CleycourtDoorPointReachedCallback
	quest2.Heroes			= 1
	quest2.Leaders			= 1
	quest2.Serfs			= 1
	
	SetupExpedition(quest2)
end


CleycourtDoorPointReachedCallback = function()
	if CleycourtDoorPointReached == nil then
		Report("ReachedCleycourt")
		CleycourtDoorPointReached = 1
		Logic.SetShareExplorationWithPlayerFlag(gvMission.PlayerID, gvMission.PlayerIDCleycourt, 1)
		StartCutscene("Cleycourt")
		checkLocation("barmecia_reach_cleycourt")
	end
end