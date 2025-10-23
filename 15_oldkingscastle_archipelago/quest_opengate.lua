createQuestOpenGate = function()

	local Quest			=	{}
	Quest.EntityName	=	"Ari"
	Quest.TargetName	=	"Gate1"
	Quest.Distance		=	500
	Quest.Callback		=	end5thSubQuest
	
	SetupExpedition(Quest)
	
end