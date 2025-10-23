CreateBriefingStoneValley = function()

	briefingStoneValley = 	{}	

	briefingStoneValley.finished = briefingStoneValleyFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingStoneValley[page] 					= 	{}
--		briefingStoneValley[page].title				= 	COLOR2.."< Leonardo >"
--		briefingStoneValley[page].text				=	"Ah you have opened the way."
		briefingStoneValley[page].title				=	String.GenericKey("Mentor")
		briefingStoneValley[page].text				=	String.Key("briefingStoneValley1.text")
		briefingStoneValley[page].position 			= 	GetPosition("Leonardo")
		briefingStoneValley[page].explore			=	1000 

		LeoExplore = briefingStoneValley[1]

	--	page 2

		page = page +1
	
		briefingStoneValley[page] 					= 	{}
--		briefingStoneValley[page].title				= 	COLOR2.."< Leonardo >"
--		briefingStoneValley[page].text				=	"I find out about a town in the east, maybe they can help us."
		briefingStoneValley[page].title				=	String.GenericKey("Mentor")
		briefingStoneValley[page].text				=	String.Key("briefingStoneValley2.text")
		briefingStoneValley[page].position 			= 	GetPosition("MordredHQ")	
		briefingStoneValley[page].marker			=	ANIMATED_MARKER
		briefingStoneValley[page].explore			=	2000
		
		MajorInfoPage = briefingStoneValley[2]
		
	--	page 3

		page = page +1
	
		briefingStoneValley[page] 					= 	{}
--		briefingStoneValley[page].title				= 	COLOR2.."< Leonardo >"
--		briefingStoneValley[page].text				=	"Be carefull now, kerberos might attack you in some minutes."
		briefingStoneValley[page].title				=	String.GenericKey("Mentor")
		briefingStoneValley[page].text				=	String.Key("briefingStoneValley3.text")
		briefingStoneValley[page].position 			= 	{}
		briefingStoneValley[page].position.X,
		briefingStoneValley[page].position.Y 		=	Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingStoneValley)
	
end

briefingStoneValleyFinished = function()

	ResolveBriefing(LeoExplore)
end