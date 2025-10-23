
createBriefingPrelude = function()

	briefingPrelude = 	{}	

	--	create refugee
	
		briefingPrelude.finished = BriefingPreludeFinished
	
--		briefingPrelude.refugee = CreateSerf(GUI.GetPlayerID(),GetPosition("firstRefugee"),1)
		
--		Move(briefingPrelude.refugee,"Dario",BRIEFING_TALK_DISTANCE)

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude1.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude1.text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")	

	--	page 2

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude2.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude2.text")
		briefingPrelude[page].position 			= 	GetPosition("VillagePosition")	
		briefingPrelude[page].explore			=	6000
		
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	"CM01_12_Kaloix/mainquest001_name_SupplyVillage"
		briefingPrelude[page].quest.text		=	"CM01_12_Kaloix/mainquest001_desc_SupplyVillage"


	--	page 3

		page = page + 1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].position 			= 	GetPosition("KI1_Entrace1")
		briefingPrelude[page].title				= 	String.Key("briefingPrelude3.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude3.text")
		briefingPrelude[page].explore			=	2000

	--	page 4
	
		page = page + 1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude4.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude4.text")
		briefingPrelude[page].position 			= 	GetPosition("CountessVillageEntrace")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
	
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	2
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	"CM01_12_Kaloix/mainquest002_name_DefendVillage"
		briefingPrelude[page].quest.text		=	"CM01_12_Kaloix/mainquest002_desc_DefendVillage"

	--	page 5
		
		page = page + 1

		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude5.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude5.text")
		briefingPrelude[page].position 			= 	GetPosition("KI1_Position")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].noScrolling		=	true

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	3
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	"CM01_12_Kaloix/mainquest003_name_DestroyEnemy"
		briefingPrelude[page].quest.text		=	"CM01_12_Kaloix/mainquest003_desc_DestroyEnemy"

		
	--	page 6	 
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude6.text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")

	--	go!
	
		StartBriefing(briefingPrelude)
	
	end


BriefingPreludeFinished = function()

--	Move("CountessSerf","CountessHQ")

	end