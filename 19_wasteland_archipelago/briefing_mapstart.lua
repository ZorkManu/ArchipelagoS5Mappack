
createBriefingMapStart = function()

	briefingMapStart = 	{}	


		local page = 0

	--	page 1
	
		page = page +1
	
		briefingMapStart[page] 					= 	{}
--		briefingMapStart[page].title				= 	COLOR2.."< Inner Voice >"
--		briefingMapStart[page].text				=	"We have reached the wastelands."
		briefingMapStart[page].title				= 	String.GenericKey("InnerVoice")
		briefingMapStart[page].text				=	String.Key("briefingMapStart1.text")
		briefingMapStart[page].position 			= 	GetPosition("Dario")	

	--	page 2

		page = page +1
	
		briefingMapStart[page] 					= 	{}
--		briefingMapStart[page].title				= 	"Supply Village"
--		briefingMapStart[page].text				=	"Let move to the mountain fortress.\n"
		briefingMapStart[page].title				=	String.Key("briefingMapStart2.title")
		briefingMapStart[page].text				=	String.Key("briefingMapStart2.text")
		briefingMapStart[page].position 			= 	GetPosition("start_1")	
		briefingMapStart[page].marker				=	ANIMATED_MARKER
		briefingMapStart[page].noScrolling			=	true

		briefingMapStart[page].quest				=	{}
		briefingMapStart[page].quest.id			=	1
		briefingMapStart[page].quest.type		=	MAINQUEST_OPEN
		briefingMapStart[page].quest.title		=	"CM01_19_Wasteland_Txt/mainquest001_name_ReachFortress"
		briefingMapStart[page].quest.text		=	"CM01_19_Wasteland_Txt/mainquest001_desc_ReachFortress"

	--	go!
	
		StartBriefing(briefingMapStart)
	
	end
