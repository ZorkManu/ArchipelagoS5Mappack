
createBriefingSearchMayor1 = function()

	briefingSearchMayor1 = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingSearchMayor1[page] 					= 	{}
		briefingSearchMayor1[page].title			= 	String.GenericKey("Mentor")
		briefingSearchMayor1[page].text				=	String.Key("briefingSearchMayor1[1].text" )
		briefingSearchMayor1[page].position			=	GetPosition(getLeadingHero())
		briefingSearchMayor1[page].dialogCamera 	= 	true

	--	page

		page = page +1

		page_searchMayor1 = page
	
		briefingSearchMayor1[page] 					= 	{}
		briefingSearchMayor1[page].title			= 	String.GenericKey("Mentor")
		briefingSearchMayor1[page].text				=	String.Key("briefingSearchMayor1[2].text")
		briefingSearchMayor1[page].position			=	GetPosition("Mayor_north")
		briefingSearchMayor1[page].explore			=	2000
		briefingSearchMayor1[page].dialogCamera 	= 	true
		briefingSearchMayor1[page].marker			=	ANIMATED_MARKER

		briefingSearchMayor1[page].quest			=	{}
		briefingSearchMayor1[page].quest.id			=	5
		briefingSearchMayor1[page].quest.type		=	MAINQUEST_OPEN
		briefingSearchMayor1[page].quest.title		=	String.MainKey.."briefingSearchMayor[2].quest.title"
		briefingSearchMayor1[page].quest.text		=	String.MainKey.."briefingSearchMayor[2].quest.text"

	--	page	
	
		page = page +1
	
		briefingSearchMayor1[page] 					= 	{}
		briefingSearchMayor1[page].title			= 	String.GenericKey("MissionObjectives")
		briefingSearchMayor1[page].position 		= 	GetPosition(getLeadingHero())
		briefingSearchMayor1[page].text				=	String.Key("briefingSearchMayor1[task1].text")
		briefingSearchMayor1[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingSearchMayor1)
		
	end
	
	
	
	