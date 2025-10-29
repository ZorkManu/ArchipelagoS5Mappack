
-- Met Helias

createBriefingHelias = function()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral )

	briefingHelias = {}	

	briefingHelias.finished = BriefingHelias

		local page = 0

	--	page
	
		page = page +1
	
		briefingHelias[page] 					= 	{}
		briefingHelias[page].title				= 	String.GenericKey("Helias")
		briefingHelias[page].text				=	String.Key("briefingHelias[1].text")
		briefingHelias[page].position 			= 	GetPosition("HeliasNPC")	
		briefingHelias[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingHelias[page] 					= 	{}
		briefingHelias[page].title				= 	String.GenericKey("Helias")
		briefingHelias[page].text				=	String.Key("briefingHelias[2].text")
		briefingHelias[page].position 			= 	GetPosition("HeliasNPC")	
		briefingHelias[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingHelias[page] 					= 	{}
		briefingHelias[page].title				= 	String.GenericKey("Helias")
		briefingHelias[page].text				=	String.Key("briefingHelias[3].text")
		briefingHelias[page].position 			= 	GetPosition("CountessCastle")	

	--	page
	
		page = page +1
		page_briefingHeliasQuest = page

		briefingHelias[page] 					= 	{}
		briefingHelias[page].title				= 	String.GenericKey("Helias")
		briefingHelias[page].text				=	String.Key("briefingHelias[4].text")
		briefingHelias[page].position 			= 	GetPosition("HeliasNPC")	
		briefingHelias[page].dialogCamera 		= 	true

		briefingHelias[page].quest				=	{}
		briefingHelias[page].quest.id			=	3
		briefingHelias[page].quest.type			=	MAINQUEST_OPEN
		briefingHelias[page].quest.title		=	String.Key("briefingHelias[4].quest.title")
		briefingHelias[page].quest.text			=	String.Key("briefingHelias[4].quest.text")

	--	page
	
		page = page +1
	
		briefingHelias[page] 					= 	{}
		briefingHelias[page].title				= 	String.GenericKey("MissionObjectives")
		briefingHelias[page].text				=	String.Key("briefingHelias[5].text")
		briefingHelias[page].position 			= 	{}
		briefingHelias[page].position.X,
		briefingHelias[page].position.Y 		=	Camera.ScrollGetLookAt()
		briefingHelias[page].dialogCamera 		= 	true
	-- go!
	
		StartBriefing(briefingHelias)
	
	end


BriefingHelias = function()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile	)

end