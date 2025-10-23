createBriefingUni = function()

	briefingUni = 	{}	

	briefingUni.finished = briefingUniFinished

	local page = 0

	--	page 1
	
	page = page +1

	briefingUni[page] 					= 	{}
--	briefingUni[page].title				= 	COLOR2.."< Mayor of Barmecia >"
--	briefingUni[page].text				=	"Finaly we imprison here with you help.\nTake the orb as our gift."
	briefingUni[page].title			= 	String.Key("BarmeciaMayor")
	briefingUni[page].text			=	String.Key("briefingUni1.text")
	briefingUni[page].position 			= 	GetPosition("BarmeciaMayor")
	briefingUni[page].explore			=	1000

	--	page 2

	page = page +1

	briefingUni[page] 					= 	{}
--	briefingUni[page].title				= 	COLOR2.."< Mayor of Barmecia >"
--	briefingUni[page].text				=	"Build up a uni at this place so we can analyze the sense of this orb."
	briefingUni[page].title			= 	String.Key("BarmeciaMayor")
	briefingUni[page].text			=	String.Key("briefingUni2.text")
	briefingUni[page].position 			= 	GetPosition("CheckUniversity")
	briefingUni[page].explore			=	1500
	briefingUni[page].marker			=	STATIC_MARKER

	briefingUni[page].quest				=	{}
	briefingUni[page].quest.id			=	3
	briefingUni[page].quest.type		=	MAINQUEST_OPEN
--	briefingUni[page].quest.title		=	"CM01_00_Tutorial1_Txt/cameraquest"
--	briefingUni[page].quest.text		=	"CM01_00_Tutorial1_Txt/camerazoom"
	briefingUni[page].quest.title	=	"CM01_06_Cleycourt_Txt/mainquest006_name_QuestUni"
	briefingUni[page].quest.text	=	"CM01_06_Cleycourt_Txt/mainquest006_desc_QuestUni"
		
	BuildUniPage	=	briefingUni[2]
	
	--	page 3

	page = page + 1

	briefingUni[page] 					= 	{}
--	briefingUni[page].title				= 	MISSION_OBJECTIVES
--	briefingUni[page].text				=	COLOR0.."1)"..COLOR1.."Buid University."
	briefingUni[page].title			= 	String.GenericKey("MissionObjectives")
	briefingUni[page].text			=	String.Key("briefingUni3.text")
	briefingUni[page].position 			= 	{}
	briefingUni[page].position.X,
	briefingUni[page].position.Y 		=	Camera.ScrollGetLookAt()
		
	--	go!
	
	StartBriefing(briefingUni)


end

briefingUniFinished = function()

	ResolveBriefing(briefingUni[1])

end