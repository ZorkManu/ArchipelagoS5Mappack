createBriefingEnemyLeaderCaptured = function()
	BriefingEnemyLeaderCaptured = 	{}	

	--	create refugee
	
		BriefingEnemyLeaderCaptured.finished = BriefingEnemyLeaderCapturedFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		BriefingEnemyLeaderCaptured[page] 					= 	{}
		BriefingEnemyLeaderCaptured[page].title				= 	String.GenericKey("Mentor")
		BriefingEnemyLeaderCaptured[page].text				=	String.Key("BriefingEnemyLeaderCaptured[1].text")
		BriefingEnemyLeaderCaptured[page].position		= GetPosition("BigBadGuy")
		
	
				

	--	page 

		page = page +1
	
		BriefingEnemyLeaderCaptured[page] 					= 	{}
		BriefingEnemyLeaderCaptured[page].title				= 	String.Key("BriefingEnemyLeaderCaptured[2].title")
		BriefingEnemyLeaderCaptured[page].position 			= 	GetPosition("WaitingPositionB")	
		BriefingEnemyLeaderCaptured[page].text				=	String.Key("BriefingEnemyLeaderCaptured[2].text")
		
		
		
	--	page 
		page = page +1
	
		BriefingEnemyLeaderCaptured[page] 					= 	{}
		BriefingEnemyLeaderCaptured[page].title				= 	String.GenericKey("Mentor")
		BriefingEnemyLeaderCaptured[page].position 			= 	GetPosition("Prison")	
		BriefingEnemyLeaderCaptured[page].text				=	String.Key("BriefingEnemyLeaderCaptured[3].text")
		
				
		if QuestBringToFolklung == nil then
		    BriefingEnemyLeaderCaptured[page].marker			=	ANIMATED_MARKER
		    BriefingEnemyLeaderCaptured[page].quest				=	{}
    		BriefingEnemyLeaderCaptured[page].quest.id			=	5
    		BriefingEnemyLeaderCaptured[page].quest.type		=	SUBQUEST_OPEN
    		BriefingEnemyLeaderCaptured[page].quest.title		=	String.MainKey.."BriefingEnemyLeaderCaptured[3].quest.title"
    		BriefingEnemyLeaderCaptured[page].quest.text		=	String.MainKey.."BriefingEnemyLeaderCaptured[3].quest.text" 
		
		    QuestBringToFolklung = BriefingEnemyLeaderCaptured[page]
		end
				
	--	page 

		page = page +1
	
		BriefingEnemyLeaderCaptured[page] 					= 	{}
		BriefingEnemyLeaderCaptured[page].title				= 	String.GenericKey("Mentor")
		BriefingEnemyLeaderCaptured[page].text				=	String.Key("BriefingEnemyLeaderCaptured[4].text")
		BriefingEnemyLeaderCaptured[page].position		= GetPosition("BigBadGuy")
		
		Explore.Show("WaitingPositionB","WaitingPositionB", 1500)
		StartBriefing(BriefingEnemyLeaderCaptured)
end

BriefingEnemyLeaderCapturedFinished = function()
	FreeLeaderJob = StartJob("FreeLeader")
	Explore.Hide("WaitingPositionB")
end
