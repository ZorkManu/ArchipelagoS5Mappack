
createBriefingHireTroops = function()

	briefingHireTroops =	{}	

	--	briefing finished callback function

		briefingHireTroops.finished = BriefingHireTroops

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingHireTroops[page] 			= 	{}
		briefingHireTroops[page].title		= 	String.Key("briefingHireTroops[1].title")
		briefingHireTroops[page].text		=	String.Key("briefingHireTroops[1].text")
		briefingHireTroops[page].position 	= 	GetPosition("NPC_Village2_2")	
		briefingHireTroops[page].dialogCamera = 	true

	--	page 2

		page = page +1
	
		briefingHireTroops[page] 			= 	{}
		briefingHireTroops[page].title		= 	String.Key("briefingHireTroops[1].title")
		briefingHireTroops[page].text		=	String.Key("briefingHireTroops[2].text")
		briefingHireTroops[page].position 	= 	GetPosition("NPC_Village2_2")	
		briefingHireTroops[page].dialogCamera = 	true

	--	go!
		checkLocation("thalgrund_sword_mayor")
		StartBriefing(briefingHireTroops)
	
	end

BriefingHireTroops = function()

	end	
