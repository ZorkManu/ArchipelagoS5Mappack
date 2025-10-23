createQuestReachLeo = function()

	-- Create quests
	local Quest = {}
	Quest.Heroes		=	true
	Quest.TargetName	=	"Leonardo"
	Quest.Distance		=	1300
	
	Quest.Callback 		=	end2ndQuest
	
	SetupExpedition(Quest)
end
