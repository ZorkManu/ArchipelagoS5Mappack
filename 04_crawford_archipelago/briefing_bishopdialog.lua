
createBriefingBishopDialog = function()

	briefingBishopDialog = 	{}	
	
	briefingBishopDialog.finished = BriefingBishopDialog

		local page = 0

	--	page
	
		page = page +1

		briefingBishopDialog[page] 					= 	{}
		briefingBishopDialog[page].title			= 	String.GenericKey("Bishop")
		briefingBishopDialog[page].text				=	String.Key("briefingBishopDialog[1].text")
		briefingBishopDialog[page].position			=	GetPosition("bishop")
		briefingBishopDialog[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
		PageBishopExplore = page

		briefingBishopDialog[page] 					= 	{}
		briefingBishopDialog[page].title			= 	String.GenericKey("Bishop")
		briefingBishopDialog[page].text				=	String.Key("briefingBishopDialog[2].text")
		briefingBishopDialog[page].position			=	GetPosition("regentMoveTo")
		briefingBishopDialog[page].explore			=	2000			
		briefingBishopDialog[page].dialogCamera 		= 	true

	--	page
	
		page = page +1

		briefingBishopDialog[page] 					= 	{}
		briefingBishopDialog[page].title			= 	String.GenericKey("Bishop")
		briefingBishopDialog[page].text				=	String.Key("briefingBishopDialog[3].text")
		briefingBishopDialog[page].position			=	GetPosition("bishop")
		briefingBishopDialog[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
		PageBishopQuest = page

		briefingBishopDialog[page] 					= 	{}
		briefingBishopDialog[page].title			= 	String.GenericKey("Bishop")
		briefingBishopDialog[page].text				=	String.Key("briefingBishopDialog[4].text")
		briefingBishopDialog[page].position			=	GetPosition("bishop_Camera")
		briefingBishopDialog[page].dialogCamera 		= 	true
		briefingBishopDialog[page].explore			=	2000			

		briefingBishopDialog[page].quest			=	{}
		briefingBishopDialog[page].quest.id			=	6
		briefingBishopDialog[page].quest.type		=	SUBQUEST_OPEN
		briefingBishopDialog[page].quest.title		=	String.MainKey.."briefingBishopDialog[4].quest.title"
		briefingBishopDialog[page].quest.text		=	String.MainKey.."briefingBishopDialog[4].quest.text"

	--	page

		page = page +1

		briefingBishopDialog[page] 					= 	{}
		briefingBishopDialog[page].title			= 	String.GenericKey("Bishop")
		briefingBishopDialog[page].text				=	String.Key("briefingBishopDialog[5].text")
		briefingBishopDialog[page].position			=	GetPosition("bishop")
		briefingBishopDialog[page].dialogCamera 		= 	true



	--	go!
	
		StartBriefing(briefingBishopDialog)

	end
	
	
	
	
BriefingBishopDialog = function()

	ResolveBriefing(briefingBishopDialog[PageBishopExplore])

end

