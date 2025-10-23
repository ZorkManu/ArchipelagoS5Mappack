createQuestFindAri = function()

	-- Create quests
	local Quest = {}
	Quest.Leaders		=	true
	Quest.Heroes		=	true
	Quest.Serfs			=	true
	Quest.TargetName	=	"Ari_find"
	Quest.Distance		=	1000
	
	Quest.Callback 		=	end2ndQuest
	
	SetupExpedition(Quest)

end