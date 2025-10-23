
createBriefingNpc2 = function()

	DisableNpcMarker("npc2")

	briefingNpc2 = {}	
	
	briefingNpc2.finished =  BriefingNpc2Finished


		local page = 0

	--	page
	
		page = page +1
	
		briefingNpc2[page] 					= 	{}
		briefingNpc2[page].title			= 	String.GenericKey("Villager")
		briefingNpc2[page].text				=	String.Key("briefingNpc2[1].text")
		briefingNpc2[page].position 		= 	GetPosition("npc2")	
		briefingNpc2[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingNpc2[page] 					= 	{}
		briefingNpc2[page].title			= 	String.GenericKey("Villager")
		briefingNpc2[page].text				=	String.Key("briefingNpc2[2].text")
		briefingNpc2[page].position 		= 	GetPosition("npc2")	
		briefingNpc2[page].dialogCamera 	= 	true

		StartBriefing(briefingNpc2)
	
	end



BriefingNpc2Finished = function()

	if IsAlive("npc2_target") then
		MoveAndVanish("npc2", "npc2_target")
	end


end