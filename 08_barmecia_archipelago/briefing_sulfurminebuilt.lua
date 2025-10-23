createBriefingSulfurMineBuilt = function()
	BriefingSulfurMineBuilt = 	{}	

	BriefingSulfurMineBuilt.finished = BriefingSulfurMineBuiltFinished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingSulfurMineBuilt[page] 					= 	{}
	BriefingSulfurMineBuilt[page].title				= 	String.GenericKey("Pilgrim")
	BriefingSulfurMineBuilt[page].text				=	String.Key("BriefingSulfurMineBuilt[1].text")
	BriefingSulfurMineBuilt[page].position 			= 	GetPosition("PilgrimNPC")

	--	page 5
	
	page = page +1

	BriefingSulfurMineBuilt[page] 					= 	{}
	BriefingSulfurMineBuilt[page].title				= 	String.GenericKey("Pilgrim")
	BriefingSulfurMineBuilt[page].text				=	String.Key("BriefingBuildSulfurMine[3].text")
	BriefingSulfurMineBuilt[page].position 			= 	GetPosition("BanditsHQ2")
	BriefingSulfurMineBuilt[page].explore			=	2000
	
	
	RobbersExploreBriefing = BriefingSulfurMineBuilt[page]
	

	--	go!
	
	StartBriefing(BriefingSulfurMineBuilt)
end


BriefingSulfurMineBuiltFinished = function()
			ResolveBriefing(RobbersExploreBriefing)
end