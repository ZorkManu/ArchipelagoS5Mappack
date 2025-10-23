
createBriefingPrelude = function()

	briefingPrelude = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Erec")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].position			=	GetPosition("Dario")

	--	page 2

		page = page +1

		page_Leo = page
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Erec")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].position			=	GetPosition("Leo")
		briefingPrelude[page].explore			=	2000
		briefingPrelude[page].marker			=	ANIMATED_MARKER

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[2].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[2].quest.text"

	--	page	 3
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Erec")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].position 			= 	GetPosition("barmeciaCastle")
		briefingPrelude[page].explore			=	3000

	--	page	 4
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Erec")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[4].text")
		briefingPrelude[page].position 			= 	GetPosition("defendView2")
		briefingPrelude[page].explore			=	3000

	--	page	 5
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Erec")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[5].text")
		briefingPrelude[page].position 			= 	GetPosition("defendView1")
		briefingPrelude[page].explore			=	3000

	--	page	4
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[6].text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")

	--	go!
	
		StartBriefing(briefingPrelude)
		
	end
	