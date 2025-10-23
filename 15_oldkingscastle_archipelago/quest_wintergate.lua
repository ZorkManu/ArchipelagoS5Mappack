createQuestWinterGate = function()

	local Quest 		= {}
	Quest.Heroes		=	true
	Quest.Leaders		=	true
	Quest.TargetName	=	"StartWinterGate"
	Quest.Distance		=	500
	
	Quest.Callback		=	end1stQuest
	
	SetupExpedition(Quest)
end