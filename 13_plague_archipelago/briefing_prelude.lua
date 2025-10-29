
-- Hermit meets Heroes at start

createBriefingPrelude = function()

	briefingPrelude = 	{}	

	--	create refugee
	
		briefingPrelude.finished = BriefingPreludeFinished

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Villager")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].npc				=	{}
		briefingPrelude[page].npc.id			=	GetID("npcPilgrim")
		briefingPrelude[page].npc.isObserved	=	true
		briefingPrelude[page].dialogCamera 		= 	true

	--	page 2
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Villager")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].position 			= 	GetPosition("destroyedVillage")	
		briefingPrelude[page].explore			=	2000

	--	page 3	 
	
		page = page +1

		page_briefingPreludeQuest = page
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Villager")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].position 			= 	GetPosition("CountessCastle")	
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			=	2000
		
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.Key("briefingPrelude[3].quest.title")
		briefingPrelude[page].quest.text		=	String.Key("briefingPrelude[3].quest.text")

	--	page 4

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Dario")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[4].text")
		briefingPrelude[page].position 			= 	GetPosition(getLeadingHero())	
		briefingPrelude[page].dialogCamera 		= 	true
		
	--	page 4

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[5].text")
		briefingPrelude[page].position 			= 	GetPosition(getLeadingHero())	
		briefingPrelude[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingPrelude)
	
	end




BriefingPreludeFinished = function()

	end