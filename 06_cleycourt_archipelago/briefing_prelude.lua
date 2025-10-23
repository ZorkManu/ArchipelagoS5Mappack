createBriefingPrelude = function()

		briefingPrelude = 	{}	

	--	change serf player id
	
		briefingPrelude.finished = BriefingPreludeFinished
		briefingPrelude.refugee = GetID("Leonardo")
		EnableNpcMarker("Leonardo")
		Move("Leonardo", "Dario", BRIEFING_TALK_DISTANCE)
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"Welcome old Friends."
		briefingPrelude[page].title			= 	String.GenericKey("Leonardo")
		briefingPrelude[page].text			=	String.Key("briefingPrelude1.text")
		briefingPrelude[page].npc				=	{}
		briefingPrelude[page].npc.id			=	briefingPrelude.refugee
		briefingPrelude[page].npc.isObserved	=	true

	--	page 2

		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"The Mayor of Barmecia wants to talk with you.\n"
		briefingPrelude[page].title			= 	String.GenericKey("Leonardo")
		briefingPrelude[page].text			=	String.Key("briefingPrelude2.text")
		briefingPrelude[page].position 			= 	GetPosition("BarmeciaMayor")	
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			=	2000

		MeetBarmeciaPage = briefingPrelude[2]

	--	page 3
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"Me self have to find an important artefact in this region.\nGood luck to you!"
		briefingPrelude[page].title			= 	String.GenericKey("Leonardo")
		briefingPrelude[page].text			=	String.Key("briefingPrelude3.text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")

	--	page 4

		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	MISSION_OBJECTIVES
--		briefingPrelude[page].text				=	COLOR0.."1)"..COLOR1.."Talk to Barmecias Mayor.\n"
		briefingPrelude[page].title			= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text			=	String.Key("briefingPrelude4.text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")	

	--	go!
	
		StartBriefing(briefingPrelude)
	
end

BriefingPreludeFinished = function()

	InitNPC("Leonardo")
	SetNPCWaypoints("Leonardo", "LeoCheckpoint", 30)
	
end