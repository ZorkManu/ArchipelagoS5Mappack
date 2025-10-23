createQuestReachBarmecia = function()
	local quest = {}

	quest.TargetName 	= "Barmecia_DoorPoint1"		
	quest.Distance 		= 500			
	quest.Callback 		= BarmeciaDoorPointReachedCallback
	quest.Heroes			= 1
	quest.Leaders			= 1
	quest.Serfs			= 1

	SetupExpedition(quest)
	
	local quest2 = {}
	quest2.TargetName 	= "Barmecia_DoorPoint2"		
	quest2.Distance 		= 1000			
	quest2.Callback 		= BarmeciaDoorPointReachedCallback
	quest2.Heroes			= 1
	quest2.Leaders			= 1
	quest2.Serfs			= 1
	
	SetupExpedition(quest2)
	
	local quest3 = {}
	quest3.TargetName 	= "Barmecia_DoorPoint3"		
	quest3.Distance 		= 1000			
	quest3.Callback 		= BarmeciaDoorPointReachedCallback
	quest3.Heroes			= 1
	quest3.Leaders			= 1
	quest3.Serfs			= 1
	
	SetupExpedition(quest3)
end


BarmeciaDoorPointReachedCallback = function()
	if BarmeciaDoorPointReached == nil then
		Report("ReachedBarmecia")
		BarmeciaDoorPointReached = 1
		Logic.SetShareExplorationWithPlayerFlag(gvMission.PlayerID, gvMission.PlayerIDBarmecia, 1)
		StartCutscene("Barmecia")
		checkLocation("barmecia_reach_barmecia")
	end
end