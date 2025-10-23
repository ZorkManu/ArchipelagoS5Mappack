
createBriefingNPCRiver1 = function()

	briefingNPCRiver1 = 	{}	

	briefingNPCRiver1.finished = BriefingNPCRiver1

	local page = 0

	--	page
	
		page = page +1
	
		briefingNPCRiver1[page] 			= 	{}
		briefingNPCRiver1[page].title		= 	String.GenericKey("Farmer")
		briefingNPCRiver1[page].text		=	String.Key("briefingNPCRiver1[1].text")
		briefingNPCRiver1[page].position	=	GetPosition("NPC_River1")
		briefingNPCRiver1[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingNPCRiver1[page] 			= 	{}
		briefingNPCRiver1[page].title		= 	String.GenericKey("Farmer")
		briefingNPCRiver1[page].text		=	String.Key("briefingNPCRiver1[2].text")
		briefingNPCRiver1[page].position	=	GetPosition(getLeadingHero())
		briefingNPCRiver1[page].dialogCamera 	= 	true

	--	page 
	
		page = page +1
	
		briefingNPCRiver1[page] 			= 	{}
		briefingNPCRiver1[page].title		= 	String.GenericKey("Mentor")
		briefingNPCRiver1[page].text		=	String.Key("briefingNPCRiver1[3].text")
		briefingNPCRiver1[page].position 	= 	GetPosition("NPC_River1")
		briefingNPCRiver1[page].dialogCamera 	= 	true

	-- Go!

		StartBriefing(briefingNPCRiver1)

	end

	
BriefingNPCRiver1 = function()
	
		DisableNpcMarker("NPC_River1")

	-- give player 500 Taler
		Tools.GiveResouces(GetHumanPlayer(), 500, 0, 0, 0, 0, 0)

	end	
	