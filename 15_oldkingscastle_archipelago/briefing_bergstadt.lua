createBriefingBergstadt = function()

		briefingBergstadt 						= 	{}	

	
		briefingBergstadt.finished 				=	briefingBergstadtFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingBergstadt[page] 				= 	{}
		briefingBergstadt[page].title			= 	String.GenericKey("Mayor")
		briefingBergstadt[page].text			=	String.Key("briefingBergstadt[1].text")
		briefingBergstadt[page].position 		= 	GetPosition("BergstadtNPC")
		briefingBergstadt[page].dialogCamera 	= 	true

	--	page 2
	
		page = page +1
	
		briefingBergstadt[page] 				= 	{}
		briefingBergstadt[page].title			= 	String.GenericKey("Helias")
		briefingBergstadt[page].text			=	String.Key("briefingBergstadt[2].text")
		briefingBergstadt[page].position 		= 	GetPosition("Helias")
		briefingBergstadt[page].dialogCamera 	= 	true

	--	page 2b
	
		page = page +1
	
		briefingBergstadt[page] 				= 	{}
		briefingBergstadt[page].title			= 	String.GenericKey("Helias")
		briefingBergstadt[page].text			=	String.Key("briefingBergstadt[2b].text")
		briefingBergstadt[page].position 		= 	GetPosition("Ari")
		briefingBergstadt[page].dialogCamera 	= 	true

	--	page 3
	
		page = page +1
	
		briefingBergstadt[page] 				= 	{}
		briefingBergstadt[page].title			= 	String.GenericKey("Mayor")
		briefingBergstadt[page].text			=	String.Key("briefingBergstadt[3].text")
		briefingBergstadt[page].position 		= 	GetPosition("BergstadtNPC")
		briefingBergstadt[page].dialogCamera 	= 	true

	--	page 4

		page = page +1
	
		briefingBergstadt[page] 				= 	{}
		briefingBergstadt[page].title			= 	String.GenericKey("Mayor")
		briefingBergstadt[page].position 		= 	GetPosition("BergstadtNPC")	
		briefingBergstadt[page].text			=	String.Key("briefingBergstadt[4].text")

		briefingBergstadt[page].quest			=	{}
		briefingBergstadt[page].quest.id		=	5
		briefingBergstadt[page].quest.type		=	SUBQUEST_OPEN
		briefingBergstadt[page].quest.title		=	String.MainKey.."briefingBergstadt[4].quest.title"
		briefingBergstadt[page].quest.text		=	String.MainKey.."briefingBergstadt[4].quest.text"

		BergstadtTributePage = briefingBergstadt[page]
	
	--	page 5

		page = page + 1

		briefingBergstadt[page] 				= 	{}
		briefingBergstadt[page].title			= 	String.GenericKey("MissionObjectives")
		briefingBergstadt[page].text			=	String.Key("briefingBergstadt[5].text")
		briefingBergstadt[page].position 		= 	GetPosition("Helias")	
		briefingBergstadt[page].dialogCamera 	= 	true

	--	page 6

		page = page + 1

		briefingBergstadt[page] 				= 	{}
		briefingBergstadt[page].title			= 	String.GenericKey("Mentor")
		briefingBergstadt[page].text			=	String.Key("briefingNothingToDo[1].text")
		briefingBergstadt[page].position 		= 	{}
		briefingBergstadt[page].position.X,
		briefingBergstadt[page].position.Y 		=	Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingBergstadt)
	
	end


briefingBergstadtFinished = function()

	DisableNpcMarker("BergstadtNPC")
	InitNPC("BergstadtNPC")

end