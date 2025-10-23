createBriefingFolklungReached = function()
		BriefingFolklungReached = 	{}	

	--	create refugee
	
		BriefingFolklungReached.finished = BriefingFolklungReachedFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		BriefingFolklungReached[page] 					= 	{}
		BriefingFolklungReached[page].title				= 	String.GenericKey("Mentor")
		BriefingFolklungReached[page].text				=	String.Key("briefingFolklungReached[1].text")
		BriefingFolklungReached[page].position		= GetPosition("FolklungEntrance")
				

	--	page 

	
		page = page +1
	
		BriefingFolklungReached[page] 					= 	{}
		BriefingFolklungReached[page].title				= 	String.GenericKey("MissionObjectives")
		BriefingFolklungReached[page].position 			= 	GetPosition("FolklungCastle")	
		BriefingFolklungReached[page].text				=	String.Key("briefingFolklungReached[2].text")
		BriefingFolklungReached[page].marker			=	ANIMATED_MARKER
		BriefingFolklungReached[page].explore			= 1000
		
		BriefingFolklungReached[page].quest				=	{}
		BriefingFolklungReached[page].quest.id			=	3
		BriefingFolklungReached[page].quest.type		=	SUBQUEST_OPEN
		BriefingFolklungReached[page].quest.title		=	String.MainKey.."briefingFolklungReached[2].quest.title"
		BriefingFolklungReached[page].quest.text		=	String.MainKey.."briefingFolklungReached[2].quest.text" 
		
		QuestFolklungCastle = BriefingFolklungReached[page]
		
			--	page 
		
		
		page = page +1
	
		BriefingFolklungReached[page] 					= 	{}
		BriefingFolklungReached[page].title				= 	String.GenericKey("Mentor")
		BriefingFolklungReached[page].position 			= 	GetPosition("FolklungEntrance")	
		BriefingFolklungReached[page].text				=	String.Key("briefingFolklungReached[3].text")

	--	go!
		StartBriefing(BriefingFolklungReached)
end

BriefingFolklungReachedFinished = function()
	
end