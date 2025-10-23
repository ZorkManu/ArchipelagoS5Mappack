createBriefingRock2Destroyed = function()
	    BriefingRock2Destroyed = 	{}	

	--	create refugee
	
		BriefingRock2Destroyed.finished = BriefingRock2DestroyedFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		BriefingRock2Destroyed[page] 					= 	{}
		BriefingRock2Destroyed[page].title				= 	String.GenericKey("Salim")
		BriefingRock2Destroyed[page].text				=   String.Key("BriefingRock2Destroyed[1].text")
		BriefingRock2Destroyed[page].position		    =   GetPosition("TheRock2Pos")
				
		page = page +1
	
		BriefingRock2Destroyed[page] 					= 	{}
		BriefingRock2Destroyed[page].title				= 	String.GenericKey("Salim")
		BriefingRock2Destroyed[page].text				=   String.Key("BriefingRock2Destroyed[2].text")
		BriefingRock2Destroyed[page].position		    =   GetPosition("General_Spawn")
		BriefingRock2Destroyed[page].explore            =   1500
		BriefingRock2Destroyed[page].marker			=	ANIMATED_MARKER
		    
		BriefingRock2Destroyed[page].quest				=	{}
		BriefingRock2Destroyed[page].quest.id			=	5
		BriefingRock2Destroyed[page].quest.type		    =	SUBQUEST_OPEN
		BriefingRock2Destroyed[page].quest.title		=	String.MainKey.."BriefingRock2Destroyed[2].quest.title"
		BriefingRock2Destroyed[page].quest.text		    =	String.MainKey.."BriefingRock2Destroyed[2].quest.text" 
		
        QuestCaptureGeneralBriefing = BriefingRock2Destroyed[page]
	
	--	go!
		StartBriefing(BriefingRock2Destroyed)
end

BriefingRock2DestroyedFinished = function()
	
end