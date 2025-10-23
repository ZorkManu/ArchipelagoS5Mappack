
createBriefingMoveToCastle = function()

	briefingMoveToCastle = 	{}	

	briefingMoveToCastle.finished = BriefingMoveToCastle


		local page = 0

	--	page
	
		page = page +1
	
		briefingMoveToCastle[page] 					= 	{}
		briefingMoveToCastle[page].title			= 	String.GenericKey("Mentor")
		briefingMoveToCastle[page].text				=	String.Key("briefingMoveToCastle[1].text")
		briefingMoveToCastle[page].position			=	GetPosition("briefing3")

	--	page

		page = page +1
	
		briefingMoveToCastle[page] 					= 	{}
		briefingMoveToCastle[page].title			= 	String.GenericKey("Mentor")
		briefingMoveToCastle[page].text				=	String.Key("briefingMoveToCastle[3].text")
		briefingMoveToCastle[page].position			=	GetPosition("hawk")
		briefingMoveToCastle[page].explore			=	400

	--	page

		page = page +1

		page_supportCastle = page

		briefingMoveToCastle[page] 					= 	{}
		briefingMoveToCastle[page].title			= 	String.GenericKey("Mentor")
		briefingMoveToCastle[page].text				=	String.Key("briefingMoveToCastle[2].text")
		briefingMoveToCastle[page].position			=	GetPosition("castle")
		briefingMoveToCastle[page].explore			=	2000
		briefingMoveToCastle[page].marker			=	ANIMATED_MARKER

		briefingMoveToCastle[page].quest			=	{}
		briefingMoveToCastle[page].quest.id			=	1
		briefingMoveToCastle[page].quest.type		=	MAINQUEST_OPEN
		briefingMoveToCastle[page].quest.title		=	String.MainKey.."briefingMoveToCastle[2].quest.title"
		briefingMoveToCastle[page].quest.text		=	String.MainKey.."briefingMoveToCastle[2].quest.text" 

	--	page	
	
		page = page +1
	
		briefingMoveToCastle[page] 					= 	{}
		briefingMoveToCastle[page].title			= 	String.GenericKey("MissionObjectives")
		briefingMoveToCastle[page].position 		= 	GetPosition(getLeadingHero())
		briefingMoveToCastle[page].text				=	{	String.Key("briefingMoveToCastle[task1].text"),
															String.Key("briefingMoveToCastle[task2].text")
														}




	--	go!
	
		StartBriefing(briefingMoveToCastle)
		
	end
	
	
BriefingMoveToCastle = function()

	MakeVulnerable("castle")

end
	
	