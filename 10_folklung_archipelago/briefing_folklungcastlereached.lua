createBriefingFolklungCastleReached = function()
		BriefingFolklungCastleReached = 	{}	

	--	create refugee
	
		BriefingFolklungCastleReached.finished = BriefingFolklungCastleReachedFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		BriefingFolklungCastleReached[page] 					= 	{}
		BriefingFolklungCastleReached[page].title				= 	String.GenericKey("Mentor")
		BriefingFolklungCastleReached[page].text				=   String.Key("BriefingFolklungCastleReached[1].text")
		BriefingFolklungCastleReached[page].position		    =   GetPosition("FolklungCastle")
				

	--	page 
	
	
		page = page +1
	
		BriefingFolklungCastleReached[page] 					= 	{}
		BriefingFolklungCastleReached[page].title				= 	String.GenericKey("Salim")
		BriefingFolklungCastleReached[page].position 			= 	GetPosition("Salim")	
		BriefingFolklungCastleReached[page].text				=	String.Key("BriefingFolklungCastleReached[2].text")
		BriefingFolklungCastleReached[page].npc					= {}
		BriefingFolklungCastleReached[page].npc.id			    = "Salim"

		BriefingSalim = BriefingFolklungCastleReached[page]
	
		page = page +1
	
		BriefingFolklungCastleReached[page] 					= 	{}
		BriefingFolklungCastleReached[page].title				= 	String.GenericKey("MissionObjectives")
		BriefingFolklungCastleReached[page].position 			= 	GetPosition("TheRock")	
		BriefingFolklungCastleReached[page].text				=	String.Key("BriefingFolklungCastleReached[3].text")
		BriefingFolklungCastleReached[page].marker			=	ANIMATED_MARKER
		BriefingFolklungCastleReached[page].explore			= 1000
		
		BriefingFolklungCastleReached[page].quest				=	{}
		BriefingFolklungCastleReached[page].quest.id			=	4
		BriefingFolklungCastleReached[page].quest.type		=	SUBQUEST_OPEN
		BriefingFolklungCastleReached[page].quest.title		=	String.MainKey.."BriefingFolklungCastleReached[3].quest.title"
		BriefingFolklungCastleReached[page].quest.text		=	String.MainKey.."BriefingFolklungCastleReached[3].quest.text" 
		
		QuestDestroyRock = BriefingFolklungCastleReached[page]
		
			--	page 
		
		
		page = page +1
	
		BriefingFolklungCastleReached[page] 					= 	{}
		BriefingFolklungCastleReached[page].title				= 	String.GenericKey("Pilgrim")
		BriefingFolklungCastleReached[page].position 			= 	GetPosition("Pilgrim")	
		BriefingFolklungCastleReached[page].text				=	String.Key("BriefingFolklungCastleReached[4].text")
		BriefingFolklungCastleReached[page].npc					= {}
		BriefingFolklungCastleReached[page].npc.id			= "Pilgrim"
		BriefingPilgrim = BriefingFolklungCastleReached[page]

	--	go!
		StartBriefing(BriefingFolklungCastleReached)
end

BriefingFolklungCastleReachedFinished = function()
	ResolveBriefing(BriefingPilgrim)
	ResolveBriefing(BriefingSalim)
	RefreshRobbers()
end