

createBriefingLeoDialog = function()

	briefingLeoDialog = 	{}	

		local page = 0

	--	page1
	
		page = page +1

		briefingLeoDialog[page] 				= 	{}
		briefingLeoDialog[page].title			= 	String.GenericKey("Leonardo")
		briefingLeoDialog[page].text			=	String.Key("briefingLeoDialog[1].text")
		briefingLeoDialog[page].position		=	GetPosition("leo")
		briefingLeoDialog[page].dialogCamera 	= 	true

	--	page2
	
		page = page +1

		page_LeoDialog = page

		briefingLeoDialog[page] 				= 	{}
		briefingLeoDialog[page].title			= 	String.GenericKey("Leonardo")
		briefingLeoDialog[page].text			=	String.Key("briefingLeoDialog[2].text")
		briefingLeoDialog[page].position		=	GetPosition("fallen_rock_04")
		briefingLeoDialog[page].explore			=	2500			

		briefingLeoDialog[page].quest			=	{}
		briefingLeoDialog[page].quest.id		=	7
		briefingLeoDialog[page].quest.type		=	SUBQUEST_OPEN
		briefingLeoDialog[page].quest.title		=	String.MainKey.."briefingLeoDialog[2].quest.title"
		briefingLeoDialog[page].quest.text		=	String.MainKey.."briefingLeoDialog[2].quest.text"

	--	page3
	
		page = page +1

		briefingLeoDialog[page] 				= 	{}
		briefingLeoDialog[page].title			= 	String.GenericKey("Leonardo")
		briefingLeoDialog[page].text			=	String.Key("briefingLeoDialog[3].text")
		briefingLeoDialog[page].position		=	GetPosition("leo")
		briefingLeoDialog[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingLeoDialog)

	end
	
	
