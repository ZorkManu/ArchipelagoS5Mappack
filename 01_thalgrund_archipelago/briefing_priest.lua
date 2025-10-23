
createBriefingPriest = function()

	briefingPriest = 	{}	

	briefingPriest.finished = BriefingPriestFinished

	local page = 0

	--	page 
	
		page = page +1
	
		briefingPriest[page] 					= 	{}
		briefingPriest[page].title				= 	String.GenericKey("Mentor")
		briefingPriest[page].text				=	String.Key("briefingPriest[1].text")
		briefingPriest[page].npc    			= 	{}  
		briefingPriest[page].npc.id    			= 	GetEntityId("Johannes")
		briefingPriest[page].position 			= 	GetPosition("villageNeutral")	

		briefingPriest[page].quest				=	{}
		briefingPriest[page].quest.id			=	2
		briefingPriest[page].quest.type			=	MAINQUEST_OPEN
		briefingPriest[page].quest.title		=	String.MainKey.."briefingPriest[1].quest.title"
		briefingPriest[page].quest.text			=	String.MainKey.."briefingPriest[1].quest.text"

	--	page 

		page = page +1
		page_Abbey = page
	
		briefingPriest[page] 					= 	{}
		briefingPriest[page].title				= 	String.GenericKey("Mentor")
		briefingPriest[page].text				=	String.Key("briefingPriest[2].text")
		briefingPriest[page].position 			= 	GetPosition("Abbey")	
		briefingPriest[page].explore			=	1000
		
	--	page

		page = page +1
	
		briefingPriest[page] 					= 	{}
		briefingPriest[page].title				= 	String.GenericKey("Mentor")
		briefingPriest[page].text				=	String.Key("briefingPriest[3].text")	
		briefingPriest[page].position			=	GetPosition("Johannes")
		briefingPriest[page].explore			=	1500
		briefingPriest[page].marker				=	ANIMATED_MARKER
		briefingPriest[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingPriest[page] 					= 	{}
		briefingPriest[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPriest[page].position 			= 	GetPosition(getLeadingHero())
		briefingPriest[page].dialogCamera 		= 	true
		briefingPriest[page].text				=	{	String.Key("briefingPriest[task1].text"),
														String.Key("briefingPriest[task2].text")
													}

	-- Go!
	
		StartBriefing(briefingPriest)
	
	end


BriefingPriestFinished = function()

	ResolveBriefing(briefingPriest[page_Abbey])

	end