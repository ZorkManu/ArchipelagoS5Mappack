createQuestClosedGate = function()

	local Quest			=	{}
	Quest.Heroes		=	true
	Quest.TargetName	=	"Gate1"
	Quest.Distance		=	1000
	Quest.Callback		=	end3rdSubQuest
	
	SetupExpedition(Quest)
	
end