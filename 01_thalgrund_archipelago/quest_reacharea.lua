
createQuestReachArea = function()

	local quest = {}

	quest.EntityName 	= getLeadingHero()		
	quest.TargetName 	= "exit"		
	quest.Distance 		= 500			
	quest.Callback 		= ExitReached	

	SetupExpedition(quest)

end
	
	
	
	
ExitReached = function()

	end4thQuest()

	return true

end