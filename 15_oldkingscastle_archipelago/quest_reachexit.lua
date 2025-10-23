createQuestReachExit = function()

	-- Use rescue quest
	local Quest = {}
	Quest.EntityName 	=	"Dario"
	Quest.TargetName 	=	"Exit"
	Quest.Distance		=	2000
	
	Quest.Callback 		= 	end5thQuest

	SetupExpedition(Quest)

end