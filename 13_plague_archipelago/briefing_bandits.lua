
-- Aris Robber that "sells the armies" that follow the heroes 

createBriefingBandits = function()

	briefingBandits = {}	

		local page = 0

	--	page
	
		page = page +1
	
		briefingBandits[page] 					= 	{}
		briefingBandits[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBandits[page].text				=	String.Key("briefingBandits[1].text")
		briefingBandits[page].position 			= 	GetPosition("banditLeader")	
		briefingBandits[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingBandits[page] 					= 	{}
		briefingBandits[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBandits[page].text				=	String.Key("briefingBandits[2].text")
		briefingBandits[page].position 			= 	GetPosition("destroyedVillage")	

	--	page
	
		page = page +1
	
		briefingBandits[page] 					= 	{}
		briefingBandits[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBandits[page].text				=	String.Key("briefingBandits[3].text")
		briefingBandits[page].position 			= 	GetPosition("CountessCastle")	

	--	page
	
		page = page +1
	
		briefingBandits[page] 					= 	{}
		briefingBandits[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBandits[page].text				=	String.Key("briefingBandits[4].text")
		briefingBandits[page].position 			= 	GetPosition("banditLeader")	
		briefingBandits[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
		page_briefingBanditQuest = page
	
		briefingBandits[page] 					= 	{}
		briefingBandits[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBandits[page].text				=	String.Key("briefingBandits[5].text")
		briefingBandits[page].position 			= 	GetPosition("banditLeaderDialog")	
		briefingBandits[page].dialogCamera 		= 	true

		briefingBandits[page].quest				=	{}
		briefingBandits[page].quest.id			=	2
		briefingBandits[page].quest.type		=	MAINQUEST_OPEN
		briefingBandits[page].quest.title		=	String.Key("briefingBandits[5].quest.title")
		briefingBandits[page].quest.text		=	String.Key("briefingBandits[5].quest.text")

	--	page
	
		page = page +1
	
		briefingBandits[page] 					= 	{}
		briefingBandits[page].title				= 	String.GenericKey("MissionObjectives")
		briefingBandits[page].text				=	String.Key("briefingBandits[6].text")
		briefingBandits[page].position 			= 	{}
		briefingBandits[page].position.X,
		briefingBandits[page].position.Y 		=	Camera.ScrollGetLookAt()
		briefingBandits[page].dialogCamera 		= 	true

	--	go!

		StartBriefing(briefingBandits)

	
	end
