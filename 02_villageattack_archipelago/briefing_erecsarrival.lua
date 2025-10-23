
createBriefingErecsArrival = function()

	briefingErecsArrival = 	{}	

	briefingErecsArrival.finished = BriefingErecsArrivalFinished


	local page = 0

	--	create erec
	
		createArmyErec()

	--	page
	
		page = page +1
	
		briefingErecsArrival[page] 					= 	{}
		briefingErecsArrival[page].title			= 	String.GenericKey("Mentor")
		briefingErecsArrival[page].text				=	String.Key("briefingErecsArrival[1].text")
		briefingErecsArrival[page].position			=	GetPosition(getLeadingHero()) --TODO: change to another hero
		briefingErecsArrival[page].explore			=	2000

		briefingErecsArrival[page].npc				=	{}
		briefingErecsArrival[page].npc.id			=	getLeadingHero()
		briefingErecsArrival[page].npc.isObserved	=	true
		
	--	page
	
		page = page +1

--		page_defendVillage2 = page

		briefingErecsArrival[page] 					= 	{}
		briefingErecsArrival[page].title			= 	String.GenericKey("Mentor")
		briefingErecsArrival[page].text				=	String.Key("briefingErecsArrival[2].text")
		briefingErecsArrival[page].position			=	GetPosition("cave2")
		briefingErecsArrival[page].explore			=	1000
	--	page
	
		page = page +1

		page_defendVillage2 = page

		briefingErecsArrival[page] 					= 	{}
		briefingErecsArrival[page].title			= 	String.GenericKey("Mentor")
		briefingErecsArrival[page].text				=	String.Key("briefingErecsArrival[3].text")
		briefingErecsArrival[page].position			=	GetPosition("village2")
		briefingErecsArrival[page].explore			=	2000
		briefingErecsArrival[page].marker			=	ANIMATED_MARKER
		
		briefingErecsArrival[page].quest			=	{}
		briefingErecsArrival[page].quest.id			=	4
		briefingErecsArrival[page].quest.type		=	MAINQUEST_OPEN
		briefingErecsArrival[page].quest.title		=	String.MainKey.."briefingErecsArrival[2].quest.title"
		briefingErecsArrival[page].quest.text		=	String.MainKey.."briefingErecsArrival[2].quest.text"

				 
	--	page	
	
		page = page +1
	
		briefingErecsArrival[page] 					= 	{}
		briefingErecsArrival[page].title			= 	String.GenericKey("MissionObjectives")
		briefingErecsArrival[page].position 		= 	GetPosition(getLeadingHero()) --TODO: change to another hero
		briefingErecsArrival[page].dialogCamera 	= 	true
		briefingErecsArrival[page].text				=	{	String.Key("briefingErecsArrival[task1].text"),
															String.Key("briefingErecsArrival[task2].text")
														}
														
		briefingErecsArrival[page].npc				=	{}
		briefingErecsArrival[page].npc.id			=	getLeadingHero()
		briefingErecsArrival[page].npc.isObserved	=	true

	--	go!
	
		StartBriefing(briefingErecsArrival)

	end
	
BriefingErecsArrivalFinished = function()

	DisableNpcMarker(getLeadingHero())
	StartBinkVideo("VillageAttack2")

end
