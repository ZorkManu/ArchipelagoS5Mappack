createBriefingPriest = function()

		briefingPriest						= 	{}	

		briefingPriest.finished = BriefingPriestFinished

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPriest[page] 				= 	{}
--		briefingPriest[page].title			= 	COLOR2.."< Monk >"
--		briefingPriest[page].text			=	"Help me my brother, i have seen so much horrible things."
		briefingPriest[page].title			= 	String.Key("briefingPriest1.title")
		briefingPriest[page].text			=	String.Key("briefingPriest1.text")
		briefingPriest[page].position 		= 	GetPosition("Monk")

	--	page 2

		page = page +1
	
		briefingPriest[page] 				= 	{}
--		briefingPriest[page].title			= 	COLOR2.."< Monk >"
--		briefingPriest[page].text			=	"I want to forget all and need a special potion, at first pure water from a clean well.\n"
		briefingPriest[page].title			= 	String.Key("briefingPriest1.title")
		briefingPriest[page].text			=	String.Key("briefingPriest2.text")

		briefingPriest[page].position 		= 	GetPosition("Waterfall")	
		briefingPriest[page].explore		=	3000
		briefingPriest[page].marker			=	STATIC_MARKER
	
		briefingPriest[page].quest			=	{}
		briefingPriest[page].quest.id		=	5
		briefingPriest[page].quest.type		=	SUBQUEST_OPEN
		briefingPriest[page].quest.title	=	"CM01_11_Norfolk_txt/quest_Priest1.title"
		briefingPriest[page].quest.text	=	"CM01_11_Norfolk_txt/quest_Priest1.text"

		GetWaterPage						=	briefingPriest[2]
	
	--	page 3

		page = page +1
	
		briefingPriest[page] 				= 	{}
--		briefingPriest[page].title			= 	COLOR2.."< Monk >"
--		briefingPriest[page].text			=	"The second Part is far away in the evil land hidden in a chest.\n"
		briefingPriest[page].title			= 	String.Key("briefingPriest1.title")
		briefingPriest[page].text			=	String.Key("briefingPriest3.text")

		briefingPriest[page].position 		= 	GetPosition("Ingredient")	
		briefingPriest[page].explore		=	2500
		briefingPriest[page].marker			=	STATIC_MARKER
	
		briefingPriest[page].quest			=	{}
		briefingPriest[page].quest.id		=	6
		briefingPriest[page].quest.type		=	SUBQUEST_OPEN
		briefingPriest[page].quest.title	=	"CM01_11_Norfolk_txt/quest_Priest2.title"
		briefingPriest[page].quest.text	=	"CM01_11_Norfolk_txt/quest_Priest2.text"

		GetIngredients						=	briefingPriest[3]
	
	
	--	page 4

		page = page + 1

		briefingPriest[page] 				= 	{}
--		briefingPriest[page].title			= 	MISSION_OBJECTIVES
--		briefingPriest[page].text			=	COLOR0.."1)"..COLOR1.."Get water from the well.\n"..

		briefingPriest[page].title			= 	String.GenericKey("MissionObjectives")
		briefingPriest[page].text			=	String.Key("briefingPriest4.text")
		briefingPriest[page].position 		= 	{}
		briefingPriest[page].position.X,
		briefingPriest[page].position.Y 	=	Camera.ScrollGetLookAt()
		
	--	go!
	
		StartBriefing(briefingPriest)
		
		
	
end

BriefingPriestFinished = function()

	DisableNpcMarker("Monk")
	
end
