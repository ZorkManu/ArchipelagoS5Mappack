createQuestOpenGates = function()

	local Quest			=	{}
	Quest.Heroes		=	true
	Quest.TargetName	=	"AriGate1"
	Quest.Distance		=	1000
	
	Quest.Callback		=	NearGate
	
	SetupExpedition(Quest)

end

NearGate	=	function()

	-- Replace gate

	Explore.Show("ShowAri", "AriBack", 2000)
	ReplaceEntity("AriGate1", Entities.XD_PalisadeGate2)

	end9thSubQuest()
end
