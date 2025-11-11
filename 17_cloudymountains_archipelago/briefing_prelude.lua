createBriefingPrelude = function()

		briefingPrelude = 	{}	

	--	preinit
	
		briefingPrelude.finished = briefingPreludeFinished
	
		Logic.ChangeAllEntitiesPlayerID(8, 1)

		briefingPrelude.refugee = GetID("Leonardo")

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title			= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"Hello friends."
		briefingPrelude[page].title				=	String.GenericKey("Leonardo")
		briefingPrelude[page].text				=	String.Key("briefingPrelude1.text")
		briefingPrelude[page].position 			= 	GetPosition("Leonardo")
		briefingPrelude[page].dialogCamera 		= 	true


	--	page 2

		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"This is your new Castle.\n"
		briefingPrelude[page].position 			= 	GetPosition("HQ")	
		briefingPrelude[page].title				=	String.GenericKey("Leonardo")
		briefingPrelude[page].text				=	String.Key("briefingPrelude2.text")
		

	--	page 3

		page = page + 1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"I have to locate the missing orb, this will need some time."
		briefingPrelude[page].position 			= 	GetPosition("Leonardo")
		briefingPrelude[page].title				=	String.GenericKey("Leonardo")
		briefingPrelude[page].text				=	String.Key("briefingPrelude3.text")
		briefingPrelude[page].dialogCamera 		= 	true

	--	page 4
	
		page = page + 1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"I think after you build up a large village i have found the orb."
		briefingPrelude[page].title				=	String.GenericKey("Leonardo")
		briefingPrelude[page].text				=	String.Key("briefingPrelude4.text")

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	"CM01_17_CloudyMountains_Txt/mainquest002_name_Buildup"
		briefingPrelude[page].quest.text		=	"CM01_17_CloudyMountains_Txt/mainquest002_desc_Buildup"

		BuildUpPage = briefingPrelude[4]

	--	page 5

		page = page + 1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"Someting important for you, don't destroy this stones until you have some defense."
		briefingPrelude[page].position 			= 	GetPosition("RockSouth2")
		briefingPrelude[page].title				=	String.GenericKey("Leonardo")
		briefingPrelude[page].text				=	String.Key("briefingPrelude5.text")
		briefingPrelude[page].explore			=	1000
		briefingPrelude[page].marker			=	STATIC_MARKER
		
		SouthBlockingPage = briefingPrelude[5]
		
	--	page 6

		page = page + 1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Leonardo >"
--		briefingPrelude[page].text				=	"Behind them an outpost of Kerberos is awaiting you!"
		briefingPrelude[page].position 			= 	GetPosition("RockEast2")
		briefingPrelude[page].title				=	String.GenericKey("Leonardo")
		briefingPrelude[page].text				=	String.Key("briefingPrelude6.text")
		briefingPrelude[page].explore			=	1000
		briefingPrelude[page].marker			=	STATIC_MARKER
		
		EastBlockingPage = briefingPrelude[6]
		
	--	page 7
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	MISSION_OBJECTIVES
--		briefingPrelude[page].text				=	COLOR0.."1)"..COLOR1.."Worker Population must reach more than 100.\n"
		briefingPrelude[page].title				=	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude7.text")
		briefingPrelude[page].position 			= 	GetPosition(getLeadingHero())

	--	go!
	
		StartBriefing(briefingPrelude)
	
end


briefingPreludeFinished = function()

	DisableNpcMarker("Leonardo")
	
	InitNPC("Leonardo")
	Move("Leonardo","Leo_StandPos1")
	SetNPCWaypoints("Leonardo", "Leo_StandPos", 120)
     	local ID = GetID("Leonardo")
	Logic.RotateEntity(ID, 180)
	
end