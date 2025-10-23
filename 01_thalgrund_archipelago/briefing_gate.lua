-- Player reaches empty closed Gate, keymaster is away, need troops to free him
createBriefingGate = function()

	briefingGate =	{}	

	--	briefing finished callback function

		briefingGate.finished = BriefingGate

		local page = 0

	--	page
	
		page = page +1
	
		page_gateKeeper = page
	
		briefingGate[page] 				= 	{}
		briefingGate[page].title		= 	String.GenericKey("Mentor")
		briefingGate[page].text			=	String.Key("briefingGate[1].text")
		briefingGate[page].position 	= 	GetPosition("gate")	

		briefingGate[page].quest		=	{}
		briefingGate[page].quest.id		=	6
		briefingGate[page].quest.type	=	SUBQUEST_OPEN
		briefingGate[page].quest.title	=	String.MainKey.."briefingGate[1].quest.title"
		briefingGate[page].quest.text	=	String.MainKey.."briefingGate[1].quest.text"

	--	page
	
		page = page +1

		briefingGate[page] 				= 	{}
		briefingGate[page].title		= 	String.GenericKey("Mentor")
		briefingGate[page].text			=	String.Key("briefingGate[2].text")
		briefingGate[page].position 	= 	GetPosition("Jail1")	
		briefingGate[page].explore		=	2000

	--	page
	
		page = page +1

		briefingGate[page] 				= 	{}
		briefingGate[page].title		= 	String.GenericKey("Mentor")
		briefingGate[page].text			=	String.Key("briefingGate[3].text")
		briefingGate[page].position 	= 	GetPosition(getLeadingHero())	
--		briefingGate[page].dialogCamera = 	true

	--	go!
	
		StartBriefing(briefingGate)
	
	end

BriefingGate = function()

	end	
	
	
BriefingGate_Message = function()

--	Message("Search the golden key!")

	end
