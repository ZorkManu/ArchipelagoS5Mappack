
createBriefingPrelude = function()

	briefingPrelude = 	{}	

	--	change serf player id
	
		briefingPrelude.finished = BriefingPreludeFinished
	
		-- create messenger
		
		local x, y 		= Tools.GetPosition("MessengerSpawn")
		local LeaderID 	= Logic.CreateEntity(Entities.PU_LeaderCavalry1, x, y+1, 250, 6)
		Logic.SetEntityName(LeaderID, "TendrelSerf")

		briefingPrelude.refugee = GetID("TendrelSerf")
		EnableNpcMarker("TendrelSerf")
		
		Move(briefingPrelude.refugee,"Dario",BRIEFING_TALK_DISTANCE*2)

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Messenger")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		
		briefingPrelude[page].npc				=	{}
		briefingPrelude[page].npc.id			=	briefingPrelude.refugee
		briefingPrelude[page].npc.isObserved	=	true

	--	page 2

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Messenger")
		briefingPrelude[page].position 			= 	GetPosition("Major")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].explore 			= 	1500
		briefingPrelude[page].marker			=	ANIMATED_MARKER

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	7
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[2].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[2].quest.text"

		meetMajor = briefingPrelude[page]

	--	page 3

		page = page + 1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition("Dario")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[task1].text")
		briefingPrelude[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingPrelude)
	
	end


BriefingPreludeFinished = function()

	DisableNpcMarker("TendrelSerf")
	
	-- Move and vanish
	MoveAndVanish("TendrelSerf", "Major")

end