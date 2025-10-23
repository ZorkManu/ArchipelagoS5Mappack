
createBriefingSupportVillage1 = function()

	briefingSupportVillage1 = 	{}	

	local page = 0

	--	page
	
		page = page +1

		page_supportVillage1 = page
		
		briefingSupportVillage1[page] 					= 	{}
		briefingSupportVillage1[page].title				= 	String.Key("briefingSupportVillage1[1].title" )
		briefingSupportVillage1[page].text				=	String.Key("briefingSupportVillage1[1].text" )
		briefingSupportVillage1[page].position			=	GetPosition("Mayor_north")
--		briefingSupportVillage1[page].explore			=	2000
		briefingSupportVillage1[page].marker			=	ANIMATED_MARKER
		briefingSupportVillage1[page].dialogCamera 		= 	true

		briefingSupportVillage1[page].quest				=	{}
		briefingSupportVillage1[page].quest.id			=	3
		briefingSupportVillage1[page].quest.type		=	MAINQUEST_OPEN
		briefingSupportVillage1[page].quest.title		=	String.MainKey.."briefingSupportVillage1[1].quest.title" 
		briefingSupportVillage1[page].quest.text		=	String.MainKey.."briefingSupportVillage1[1].quest.text" 

	--	page

		page = page +1

		briefingSupportVillage1[page] 					= 	{}
		briefingSupportVillage1[page].title				= 	String.Key("briefingSupportVillage1[1].title" )
		briefingSupportVillage1[page].text				=	String.Key("briefingSupportVillage1[2].text" )
		briefingSupportVillage1[page].position			=	GetPosition("cave1")
		briefingSupportVillage1[page].explore			=	1000

	--	page	
	
		page = page +1
	
		briefingSupportVillage1[page] 					= 	{}
		briefingSupportVillage1[page].title				= 	String.Key("briefingSupportVillage1[1].title" )
		briefingSupportVillage1[page].text				=	String.Key("briefingSupportVillage1[3].text" )
		briefingSupportVillage1[page].position 			= 	GetPosition("Mayor_north")
		briefingSupportVillage1[page].dialogCamera 		= 	true
		
	--	page	
	
		page = page +1
	
		briefingSupportVillage1[page] 					= 	{}
		briefingSupportVillage1[page].title				= 	String.Key("briefingSupportVillage1[1].title" )
		briefingSupportVillage1[page].position 			= 	GetPosition("village1")
		briefingSupportVillage1[page].text				=	String.Key("briefingSupportVillage1[4].text")

	--	page	
	
		page = page +1
	
		briefingSupportVillage1[page] 					= 	{}
		briefingSupportVillage1[page].title				= 	String.GenericKey("MissionObjectives")
		briefingSupportVillage1[page].position 			= 	GetPosition(getLeadingHero())
		briefingSupportVillage1[page].text				=	String.Key("briefingSupportVillage1[task1].text")
		briefingSupportVillage1[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingSupportVillage1)
		
	end