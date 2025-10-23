
createBriefingSupportVillageGoOn = function()

	briefingSupportVillageGoOn = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingSupportVillageGoOn[page] 				= 	{}
		briefingSupportVillageGoOn[page].title			= 	String.GenericKey("Mentor")
		briefingSupportVillageGoOn[page].text			=	String.Key("briefingSupportVillageGoOn[0].text" )
		briefingSupportVillageGoOn[page].position		=	GetPosition(getLeadingHero())
		briefingSupportVillageGoOn[page].dialogCamera 		= 	true
		
	--	page
	
		page = page +1

		page_supportVillage1 = page
		
		briefingSupportVillageGoOn[page] 				= 	{}
		briefingSupportVillageGoOn[page].title			= 	String.GenericKey("Mayor")
		briefingSupportVillageGoOn[page].text			=	String.Key("briefingSupportVillageGoOn[1].text" )
		briefingSupportVillageGoOn[page].position		=	GetPosition("village1")
		briefingSupportVillageGoOn[page].explore		=	2000
		briefingSupportVillageGoOn[page].marker			=	ANIMATED_MARKER

		briefingSupportVillageGoOn[page].quest			=	{}
		briefingSupportVillageGoOn[page].quest.id		=	3
		briefingSupportVillageGoOn[page].quest.type		=	MAINQUEST_OPEN
		briefingSupportVillageGoOn[page].quest.title	=	String.MainKey.."briefingSupportVillage1[1].quest.title" 
		briefingSupportVillageGoOn[page].quest.text		=	String.MainKey.."briefingSupportVillage1[1].quest.text" 

	--	page

		page = page +1

		briefingSupportVillageGoOn[page] 				= 	{}
		briefingSupportVillageGoOn[page].title			= 	String.GenericKey("Mayor")
		briefingSupportVillageGoOn[page].text			=	String.Key("briefingSupportVillage1[2].text" )
		briefingSupportVillageGoOn[page].position		=	GetPosition("cave1")
		briefingSupportVillageGoOn[page].explore		=	1000

	--	page	
	
		page = page +1
	
		briefingSupportVillageGoOn[page] 				= 	{}
		briefingSupportVillageGoOn[page].title			= 	String.GenericKey("Mayor")
		briefingSupportVillageGoOn[page].text			=	String.Key("briefingSupportVillage1[3].text" )
		briefingSupportVillageGoOn[page].position 		= 	GetPosition("Mayor_north")
		briefingSupportVillageGoOn[page].dialogCamera 		= 	true
		
	--	page	
	
		page = page +1
	
		briefingSupportVillageGoOn[page] 				= 	{}
		briefingSupportVillageGoOn[page].title			= 	String.GenericKey("MissionObjectives")
		briefingSupportVillageGoOn[page].position 		= 	GetPosition(getLeadingHero())
		briefingSupportVillageGoOn[page].text			=	String.Key("briefingSupportVillage1[task1].text")
		briefingSupportVillageGoOn[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingSupportVillageGoOn)
		
	end