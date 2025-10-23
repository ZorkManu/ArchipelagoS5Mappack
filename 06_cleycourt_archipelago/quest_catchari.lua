createQuestCatchAri = function()

	-- Use rescue quest
	local Quest = {}
	Quest.Heroes 		=	true
	Quest.Leaders		=	true
	Quest.TargetName 	=	"AriBack"
	Quest.Distance		=	1000
	
	Quest.Callback 		= 	end5thQuest

	SetupExpedition(Quest)

end