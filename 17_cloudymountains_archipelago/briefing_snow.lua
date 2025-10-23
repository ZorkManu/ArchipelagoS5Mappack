createBriefingSnow = function()

	briefingSnow = 	{}	

	briefingSnow.finished = briefingSnowFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingSnow[page] 					= 	{}
--		briefingSnow[page].title			= 	COLOR2.."< Leonardo >"
--		briefingSnow[page].text				=	"The way is now free."
		briefingSnow[page].title				=	String.GenericKey("Mentor")
		briefingSnow[page].text				=	String.Key("briefingSnow1.text")
		briefingSnow[page].position 		= 	GetPosition("Leonardo")
		briefingSnow[page].explore			=	1000 

		LeoExplore = briefingSnow[1]

	--	page 2

		page = page +1
	
		briefingSnow[page] 					= 	{}
--		briefingSnow[page].title			= 	COLOR2.."< Leonardo >"
--		briefingSnow[page].text				=	"That what we need is in this building, but it is protected by his old owner.\n"
		briefingSnow[page].title				=	String.GenericKey("Mentor")
		briefingSnow[page].text				=	String.Key("briefingSnow2.text")
		briefingSnow[page].position 		= 	GetPosition("Orb")	
		briefingSnow[page].marker			=	ANIMATED_MARKER
		briefingSnow[page].explore			=	1000

		briefingSnow[page].quest			=	{}
		briefingSnow[page].quest.id			=	3
		briefingSnow[page].quest.type		=	MAINQUEST_OPEN
		briefingSnow[page].quest.title		=	"CM01_17_CloudyMountains_Txt/mainquest_name_Snow"
		briefingSnow[page].quest.text		=	"CM01_17_CloudyMountains_Txt/mainquest_desc_Snow"

		FindOrbPage = briefingSnow[2]

	--	page 3
	
		page = page +1
	
		briefingSnow[page] 					= 	{}
--		briefingSnow[page].title			= 	COLOR2.."< Leonardo >"
--		briefingSnow[page].text				=	"You can also buy this family heirloom for 20000 gold."
		briefingSnow[page].title				=	String.GenericKey("Mentor")
		briefingSnow[page].text				=	String.Key("briefingSnow3.text")

	--	page 4

		page = page + 1

		briefingSnow[page] 					= 	{}
--		briefingSnow[page].title			= 	MISSION_OBJECTIVES
--		briefingSnow[page].text				=	COLOR0.."1)"..COLOR1.."Destroy the building to get the orb.\n"..COLOR0.."2)"..COLOR1.."Or buy it for 20k gold.\n"
		briefingSnow[page].title				=	String.GenericKey("MissionObjectives")
		briefingSnow[page].text				=	String.Key("briefingSnow4.text")
		briefingSnow[page].position 		= 	{}
		briefingSnow[page].position.X,
		briefingSnow[page].position.Y 		= 	Camera.ScrollGetLookAt()


	--	go!
	
		StartBriefing(briefingSnow)
	
end

briefingSnowFinished = function()

	ResolveBriefing(LeoExplore)
end