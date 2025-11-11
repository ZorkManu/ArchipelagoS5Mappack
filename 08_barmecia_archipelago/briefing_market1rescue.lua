createBriefingMarket1Rescue = function()
	
	BriefingMarket1Rescue = {}
	
	BriefingMarket1Rescue.finished = BriefingMarket1RescueFinished
	
	ResolveBriefing(PreludeMarketWest)
	
	local page = 0

	--	page 1
	
	page = page +1

	BriefingMarket1Rescue[page] 						= 	{}
	BriefingMarket1Rescue[page].title				= String.Key("BriefingMarket1Rescue[1].title")
	BriefingMarket1Rescue[page].text				=	String.Key("BriefingMarket1Rescue[1].text")
	BriefingMarket1Rescue[page].position 		= 	GetPosition("Market1NPC")
		
	--	page 2

	page = page +1

	BriefingMarket1Rescue[page] 					= 	{}
	BriefingMarket1Rescue[page].title				= String.GenericKey("MissionObjectives")
	BriefingMarket1Rescue[page].text				=	String.Key("BriefingMarket1Rescue[2].text")
	BriefingMarket1Rescue[page].position 			= 	GetPosition("BanditsHQ1")
	BriefingMarket1Rescue[page].explore		=	2000
	BriefingMarket1Rescue[page].marker		=	ANIMATED_MARKER
	
	BriefingMarket1Rescue[page].quest				=	{}
	BriefingMarket1Rescue[page].quest.id			=	2
	BriefingMarket1Rescue[page].quest.type			=	SUBQUEST_OPEN
	BriefingMarket1Rescue[page].quest.title			=	String.MainKey.."BriefingMarket1Rescue[2].quest.title"
	BriefingMarket1Rescue[page].quest.text			=	String.MainKey.."BriefingMarket1Rescue[2].quest.text"

	FindRobbersBriefing = BriefingMarket1Rescue[page]

	-- inserted by TF
		page = page +1
	
		BriefingMarket1Rescue[page] 					= 	{}
		BriefingMarket1Rescue[page].title			= 	String.GenericKey("MissionObjectives")
		BriefingMarket1Rescue[page].text			=	String.Key("BriefingMarket1Rescue[task].text")
		BriefingMarket1Rescue[page].position 		= 	GetPosition(getLeadingHero())	
		BriefingMarket1Rescue[page].dialogCamera 	= 	true
	

	
	StartBriefing(BriefingMarket1Rescue)
end


BriefingMarket1RescueFinished = function()
			DisableNpcMarker("Market1NPC")
end