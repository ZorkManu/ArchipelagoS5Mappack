createBriefingBuildSulfurMine = function()
	ResolveBriefing(BriefingQuestMeetPilgrim)
	
	BriefingBuildSulfurMine = 	{}	


	BriefingBuildSulfurMine.finished = BriefingBuildSulfurMineFinished
	local page = 0

	--	page 1
	
	page = page +1

	BriefingBuildSulfurMine[page] 					= 	{}
	BriefingBuildSulfurMine[page].title				= 	String.GenericKey("Pilgrim")
	BriefingBuildSulfurMine[page].text				=	String.Key("BriefingBuildSulfurMine[1].text")
	BriefingBuildSulfurMine[page].position 			= 	GetPosition("PilgrimNPC")

	--	page 2
	
	page = page +1

	BriefingBuildSulfurMine[page] 					= 	{}
	BriefingBuildSulfurMine[page].title				= 	String.GenericKey("Pilgrim")
	BriefingBuildSulfurMine[page].text				=	String.Key("BriefingBuildSulfurMine[2].text")
	BriefingBuildSulfurMine[page].position 			= 	GetPosition("SulfurMines")
	BriefingBuildSulfurMine[page].explore				=	2000
	BriefingBuildSulfurMine[page].marker		=	ANIMATED_MARKER
	
		
	BriefingBuildSulfurMine[page].quest				=	{}
	BriefingBuildSulfurMine[page].quest.id			=	4
	BriefingBuildSulfurMine[page].quest.type			=	SUBQUEST_OPEN
	BriefingBuildSulfurMine[page].quest.title			=	String.MainKey.."BriefingBuildSulfurMine[2].quest.title"
	BriefingBuildSulfurMine[page].quest.text			=	String.MainKey.."BriefingBuildSulfurMine[2].quest.text"

	BuildSulfurMineQuest = BriefingBuildSulfurMine[page]

	-- inserted by TF
		page = page +1
	
		BriefingBuildSulfurMine[page] 					= 	{}
		BriefingBuildSulfurMine[page].title			= 	String.GenericKey("MissionObjectives")
		BriefingBuildSulfurMine[page].text			=	String.Key("BriefingBuildSulfurMine[task].text")
		BriefingBuildSulfurMine[page].position 		= 	GetPosition(getLeadingHero())	
		BriefingBuildSulfurMine[page].dialogCamera 	= 	true
	



	--	go!
	
	StartBriefing(BriefingBuildSulfurMine)
end


