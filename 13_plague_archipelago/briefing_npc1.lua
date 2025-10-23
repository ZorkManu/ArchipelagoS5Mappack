
createBriefingNpc1 = function()

	DisableNpcMarker("npc1")

	briefingNpc1 = {}	
	
	briefingNpc1.finished =  BriefingNpc1Finished

		local page = 0

	--	page
	
		page = page +1
	
		briefingNpc1[page] 					= 	{}
		briefingNpc1[page].title			= 	String.GenericKey("Villager")
		briefingNpc1[page].text				=	String.Key("briefingNpc1[1].text")
		briefingNpc1[page].position 		= 	GetPosition("npc1")	
		briefingNpc1[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
		pageStone = page
		
		briefingNpc1[page] 					= 	{}
		briefingNpc1[page].title			= 	String.GenericKey("Villager")
		briefingNpc1[page].text				=	String.Key("briefingNpc1[2].text")
		briefingNpc1[page].position 		= 	GetPosition("ShowStone2")	
		briefingNpc1[page].explore			=	500			
		briefingNpc1[page].dialogCamera 	= 	true


	--	page
	
		page = page +1
	
		briefingNpc1[page] 					= 	{}
		briefingNpc1[page].title			= 	String.GenericKey("Villager")
		briefingNpc1[page].text				=	String.Key("briefingNpc1[3].text")
		briefingNpc1[page].position 		= 	GetPosition("npc1")	
		briefingNpc1[page].dialogCamera 	= 	true

		StartBriefing(briefingNpc1)
	
	end



BriefingNpc1Finished = function()

	if IsAlive("npc1_target") then
		MoveAndVanish("npc1", "npc1_target")
	end

	ResolveBriefing(briefingNpc1[pageStone])

end