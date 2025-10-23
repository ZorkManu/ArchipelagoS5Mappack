createBriefingStoneValleyMajor = function()

	briefingStoneValleyMajor = 	{}	

		briefingStoneValleyMajor.finished = briefingStoneValleyMajorFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingStoneValleyMajor[page] 					= 	{}
--		briefingStoneValleyMajor[page].title			= 	COLOR2.."< Major >"
--		briefingStoneValleyMajor[page].text				=	"All Hail! We heared about your problem and we can help you."
		briefingStoneValleyMajor[page].title				=	String.GenericKey("Mayor")
		briefingStoneValleyMajor[page].text				=	String.Key("briefingStoneValleyMajor1.text")
		briefingStoneValleyMajor[page].position 		= 	GetPosition("Major")

	--	page 2

		page = page +1
	
		briefingStoneValleyMajor[page] 					= 	{}
--		briefingStoneValleyMajor[page].title			= 	COLOR2.."< Major >"
--		briefingStoneValleyMajor[page].text				=	"But help us first, our town need some beautification.\n"
		briefingStoneValleyMajor[page].title				=	String.GenericKey("Mayor")
		briefingStoneValleyMajor[page].text				=	String.Key("briefingStoneValleyMajor2.text")
		briefingStoneValleyMajor[page].position 		= 	GetPosition("Stonevalley_BuildPos")	
		briefingStoneValleyMajor[page].marker			=	STATIC_MARKER
		briefingStoneValleyMajor[page].explore			=	1500

		briefingStoneValleyMajor[page].quest			=	{}
		briefingStoneValleyMajor[page].quest.id			=	4
		briefingStoneValleyMajor[page].quest.type		=	SUBQUEST_OPEN
--		briefingStoneValleyMajor[page].quest.title		=	"CM01_00_Tutorial1_Txt/cameraquest"
--		briefingStoneValleyMajor[page].quest.text		=	"CM01_00_Tutorial1_Txt/camerazoom"
		briefingStoneValleyMajor[page].quest.title		=	"CM01_17_CloudyMountains_Txt/subquestquest004_name_StoneValleyMajor"
		briefingStoneValleyMajor[page].quest.text		=	"CM01_17_CloudyMountains_Txt/subquestquest004_desc_StoneValleyMajor"

		StoneValleyQuestPage = briefingStoneValleyMajor[2]

	--	page 3
	
		page = page + 1

		briefingStoneValleyMajor[page] 					= 	{}
--		briefingStoneValleyMajor[page].title			= 	MISSION_OBJECTIVES
--		briefingStoneValleyMajor[page].text				=	COLOR0.."1)"..COLOR1.."Build 3 Dario statues near fountain.\n"
		briefingStoneValleyMajor[page].title				=	String.GenericKey("MissionObjectives")
		briefingStoneValleyMajor[page].text				=	String.Key("briefingStoneValleyMajor3.text")
		briefingStoneValleyMajor[page].position 		= 	{}
		briefingStoneValleyMajor[page].position.X,
		briefingStoneValleyMajor[page].position.Y 		= Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingStoneValleyMajor)
	
end

briefingStoneValleyMajorFinished = function()

	DisableNpcMarker("Major")

end