createBriefingPrelude = function()

		briefingPrelude = 	{}	

	--	change serf player id
	
		briefingPrelude.finished = BriefingPreludeFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Dario")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")	
		briefingPrelude[page].dialogCamera 		= 	true

	--	page 2

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Dario")
		briefingPrelude[page].position 			= 	GetPosition("OldKingsCastle")					--was Garek
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		--briefingPrelude[page].dialogCamera 		= 	true
	
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	7
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[2].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[2].quest.text"

		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			=	1300

		MeetGarekPage = briefingPrelude[page]

	--	page 3
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Ari")
		briefingPrelude[page].position 			= 	GetPosition("Ari")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].dialogCamera 		= 	true


	--	page 4
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Ari")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[4].text")
		briefingPrelude[page].position 			= 	GetPosition("Helias")	
		briefingPrelude[page].dialogCamera 		= 	true


	--	page 5
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Helias")
		briefingPrelude[page].position 			= 	GetPosition("BergstadtNPC")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[5].text")

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	8
		briefingPrelude[page].quest.type		=	SUBQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[5].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[5].quest.text"
		briefingPrelude[page].marker			=	STATIC_MARKER
		briefingPrelude[page].noScrolling		=	true
		briefingPrelude[page].dialogCamera 		= 	true
		
		reachBergstadtPage = briefingPrelude[page]

	--	page 6

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[6].text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")
		briefingPrelude[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingPrelude)
	
end