createQuestGetWater = function()

	-- Create quests
	local Quest = {}
	Quest.Heroes		=	true
	Quest.TargetName	=	"Waterfall"
	Quest.Distance		=	1000
	
	Quest.Callback 		=	end2ndSubQuest
	
	SetupExpedition(Quest)

end