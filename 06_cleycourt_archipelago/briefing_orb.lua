createBriefingOrb = function()

		briefingOrb						= 	{}	

		briefingOrb.finished 			= briefingOrbFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingOrb[page] 				= 	{}
--		briefingOrb[page].title			= 	COLOR2.."< Researchers of Barmecia >"
--		briefingOrb[page].text			=	"We have found the secret of your orb."
		briefingOrb[page].title			= 	String.Key("BarmeciaResearch")
		briefingOrb[page].text			=	String.Key("briefingOrb1.text")
		briefingOrb[page].position 		= 	GetPosition("Uni")
		briefingOrb[page].explore		=	1000

	--	page 2

		page = page +1
	
		briefingOrb[page] 				= 	{}
--		briefingOrb[page].title			= 	COLOR2.."< Researchers of Barmecia >"
--		briefingOrb[page].text			=	"This orb is a part of the mystic machine near your castle.\n"
		briefingOrb[page].title			= 	String.Key("BarmeciaResearch")
		briefingOrb[page].text			=	String.Key("briefingOrb2.text")
		briefingOrb[page].position 		= 	GetPosition("Weathermachine")	
		briefingOrb[page].explore		=	2000
		briefingOrb[page].marker		=	ANIMATED_MARKER
	
		briefingOrb[page].quest			=	{}
		briefingOrb[page].quest.id		=	4
		briefingOrb[page].quest.type	=	MAINQUEST_OPEN
--		briefingOrb[page].quest.title	=	"CM01_00_Tutorial1_Txt/cameraquest"
--		briefingOrb[page].quest.text	=	"CM01_00_Tutorial1_Txt/camerazoom"
		briefingOrb[page].quest.title	=	"CM01_06_Cleycourt_Txt/mainquest007_name_QuestOrb"
		briefingOrb[page].quest.text	=	"CM01_06_Cleycourt_Txt/mainquest007_desc_QuestOrb"

		MachinePage						=	briefingOrb[2]
	
	--	page 3

		page = page +1
	
		briefingOrb[page] 				= 	{}
--		briefingOrb[page].title			= 	COLOR2.."< Researchers of Barmecia >"
--		briefingOrb[page].text			=	"Give it to Leonardo, he should be near the machine.\n"
		briefingOrb[page].title			= 	String.Key("BarmeciaResearch")
		briefingOrb[page].text			=	String.Key("briefingOrb3.text")

	
	
	--	page 4

		page = page + 1

		briefingOrb[page] 				= 	{}
--		briefingOrb[page].title			= 	MISSION_OBJECTIVES
--		briefingOrb[page].text			=	COLOR0.."1)"..COLOR1.."Bring Orb to Leonardo.\n"
		briefingOrb[page].title			= 	String.GenericKey("MissionObjectives")
		briefingOrb[page].text			=	String.Key("briefingOrb4.text")
		briefingOrb[page].position 		= 	{}
		briefingOrb[page].position.X,
		briefingOrb[page].position.Y 	=	Camera.ScrollGetLookAt()
		
	--	go!
	
		StartBriefing(briefingOrb)
	
	end


briefingOrbFinished = function()

	ResolveBriefing(briefingUni[1])

end