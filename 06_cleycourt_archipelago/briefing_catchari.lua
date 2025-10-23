createBriefingCatchAri = function()

		briefingCatchAri 						= 	{}	

	
		briefingCatchAri.finished 				=	briefingCatchAriFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingCatchAri[page] 				= 	{}
--		briefingCatchAri[page].title		= 	COLOR2.."< Mayor of Barmecia >"
--		briefingCatchAri[page].text			=	"Hello, we have a little problem with thiefs in our area."
		briefingCatchAri[page].title		= 	String.Key("BarmeciaMayor")
		briefingCatchAri[page].text			=	String.Key("briefingCatchAri1.text")
		briefingCatchAri[page].position 	= 	GetPosition("BarmeciaMayor")
		briefingCatchAri[page].dialogCamera 		= 	true

	--	page 2

		page = page +1
	
		briefingCatchAri[page] 				= 	{}
--		briefingCatchAri[page].title		= 	COLOR2.."< Mayor of Barmecia >"
--		briefingCatchAri[page].text			=	"If you catch them we will help you with your quest."
		briefingCatchAri[page].title		= 	String.Key("BarmeciaMayor")
		briefingCatchAri[page].text			=	String.Key("briefingCatchAri2.text")
		briefingCatchAri[page].dialogCamera 		= 	true

	--	page 3
	
		page = page + 1
	
		briefingCatchAri[page] 				= 	{}
--		briefingCatchAri[page].title		= 	COLOR2.."< Mayor of Barmecia >"
--		briefingCatchAri[page].text			=	"We saw them near this place last time, maybe they fleed already into their base."
		briefingCatchAri[page].title		= 	String.Key("BarmeciaMayor")
		briefingCatchAri[page].text			=	String.Key("briefingCatchAri3.text")
		briefingCatchAri[page].position 	= 	GetPosition("Ari_find")	
		briefingCatchAri[page].explore		=	2000
		briefingCatchAri[page].marker		=	STATIC_MARKER

		FindAriPage = briefingCatchAri[3]
	
	--	page 4
	
		page = page + 1
	
		briefingCatchAri[page] 				= 	{}
--		briefingCatchAri[page].title		= 	COLOR2.."< Mayor of Barmecia >"
--		briefingCatchAri[page].text			=	"This base is one of our old outposts and we can't move in"
		briefingCatchAri[page].title		= 	String.Key("BarmeciaMayor")
		briefingCatchAri[page].text			=	String.Key("briefingCatchAri4.text")
		briefingCatchAri[page].position 	= 	GetPosition("BarmeciaMovePoint1")	
		briefingCatchAri[page].noScrolling	=	true
		briefingCatchAri[page].marker		=	ANIMATED_MARKER

		briefingCatchAri[page].quest		=	{}
		briefingCatchAri[page].quest.id		=	1
		briefingCatchAri[page].quest.type	=	MAINQUEST_OPEN
		briefingCatchAri[page].quest.title	=	"CM01_06_Cleycourt_Txt/mainquest005_name_QuestCatchAri"
		briefingCatchAri[page].quest.text	=	"CM01_06_Cleycourt_Txt/mainquest005_desc_QuestCatchAri"
		
 		CatchAriPage = briefingCatchAri[4]

	--	page 5
	
		page = page + 1
	
		briefingCatchAri[page] 				= 	{}
--		briefingCatchAri[page].title		= 	COLOR2.."< Mayor of Barmecia >"
--		briefingCatchAri[page].text			=	"because kerberos stole the chest with the key."
		briefingCatchAri[page].title		= 	String.Key("BarmeciaMayor")
		briefingCatchAri[page].text			=	String.Key("briefingCatchAri5.text")
		briefingCatchAri[page].position 	= 	GetPosition("ChestPos")	
		briefingCatchAri[page].explore		=	1000
		briefingCatchAri[page].marker		=	STATIC_MARKER

		briefingCatchAri[page].quest		=	{}
		briefingCatchAri[page].quest.id		=	2
		briefingCatchAri[page].quest.type	=	MAINQUEST_OPEN
		briefingCatchAri[page].quest.title	=	"CM01_06_Cleycourt_Txt/mainquest005_name_QuestCatchAri2"
		briefingCatchAri[page].quest.text	=	"CM01_06_Cleycourt_Txt/mainquest005_desc_QuestCatchAri2"

		GetKeyPage = briefingCatchAri[5]
	
	--	page 6

		page = page + 1

		briefingCatchAri[page] 				= 	{}
--		briefingCatchAri[page].title		= 	MISSION_OBJECTIVES
--		briefingCatchAri[page].text			=	COLOR0.."1)"..COLOR1.."Catch Ari.\n"..
		briefingCatchAri[page].title		= 	String.GenericKey("MissionObjectives")
		briefingCatchAri[page].text			=	String.Key("briefingCatchAri6.text")
		briefingCatchAri[page].position 	= 	{}
		briefingCatchAri[page].position.X,
		briefingCatchAri[page].position.Y 	=	Camera.ScrollGetLookAt()

	--	go!

	
	
		StartBriefing(briefingCatchAri)
	
	end


briefingCatchAriFinished = function()

	DisableNpcMarker("BarmeciaMayor")
	InitNPC("BarmeciaMayor")

	if AriFleed ~= nil then
		ResolveBriefing(FindAriPage)
		
	end

end