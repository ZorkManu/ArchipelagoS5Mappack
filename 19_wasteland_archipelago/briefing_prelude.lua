
createBriefingPrelude = function()

	briefingPrelude = 	{}	

	--	change serf player id
	
		briefingPrelude.finished = BriefingPreludeFinished
	
		-- Stop all heroes
		Move("Dario","Dario")
		Move("Erec","Erec")
		Move("Pilgrim","Pilgrim")
		Move("Ari","Ari")
		Move("Salim","Salim")
	
		Logic.ChangeAllEntitiesPlayerID(7, 1)

		-- Attach soldiers
		local i
		for i=1,3 do
			Tools.AttachSoldiersToLeader("P1_Leader"..i, 4)
		end

		briefingPrelude.refugee = GetID("NPC_Prelude")
		EnableNpcMarker("NPC_Prelude")
		
		Move(briefingPrelude.refugee,"Dario",BRIEFING_TALK_DISTANCE)

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Serf >"
--		briefingPrelude[page].text				=	"We have awaited your coming."
		briefingPrelude[page].title				=	String.GenericKey("Serf")
		briefingPrelude[page].text				=	String.Key("briefingPrelude1.text")
		briefingPrelude[page].npc				=	{}
		briefingPrelude[page].npc.id				=	briefingPrelude.refugee
		briefingPrelude[page].npc.isObserved			=	true

	--	page 2

		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Serf >"
--		briefingPrelude[page].text				=	"This is your new Castle.\n"
		briefingPrelude[page].title				=	String.GenericKey("Serf")
		briefingPrelude[page].text				=	String.Key("briefingPrelude2.text")
		briefingPrelude[page].position 			= 	GetPosition("start_1")	
		
	--	page 3

		page = page + 1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Serf >"
--		briefingPrelude[page].text				=	"Search for more Allies in the Waste land!"
		briefingPrelude[page].title				=	String.GenericKey("Serf")
		briefingPrelude[page].text				=	String.Key("briefingPrelude3.text")
		briefingPrelude[page].position 			= 	GetPosition("preludeLeftMarker")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].noScrolling		= true

--		briefingPrelude[page].quest				=	{}
--		briefingPrelude[page].quest.id			=	6
--		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
--		briefingPrelude[page].quest.title		=	"CM01_19_Wasteland_Txt/mainquest002_name_SearchAllies"
--		briefingPrelude[page].quest.text		=	"CM01_19_Wasteland_Txt/mainquest002_desc_SearchAllies"

	--	page 4
	
		page = page + 1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Serf >"
--		briefingPrelude[page].text				=	"They are near this areas."
		briefingPrelude[page].title				=	String.GenericKey("Serf")
		briefingPrelude[page].text				=	String.Key("briefingPrelude4.text")
		briefingPrelude[page].position 			= 	GetPosition("preludeRightMarker")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].noScrolling		= true

	--	page 5	
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	MISSION_OBJECTIVES
--		briefingPrelude[page].text				=	COLOR0.."1)"..COLOR1.."Search allies on map.\n"
		briefingPrelude[page].title				=	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude5.text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")
	
	
	
		StartBriefing(briefingPrelude)
	
	end


BriefingPreludeFinished = function()

	DisableNpcMarker("NPC_Prelude")
	
	-- Move to castle
	Move("NPC_Prelude", "start_1")

	end