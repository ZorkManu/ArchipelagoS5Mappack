
createBriefingNpc3 = function()

	DisableNpcMarker("npc3")

	briefingNpc3 = {}	
	
	briefingNpc3.finished =  BriefingNpc3Finished


		local page = 0

	--	page
	
		page = page +1
	
		briefingNpc3[page] 					= 	{}
		briefingNpc3[page].title			= 	String.Key("briefingNpc3[1].title")
		briefingNpc3[page].text				=	String.Key("briefingNpc3[1].text")
		briefingNpc3[page].position 		= 	GetPosition("npc3")	
		briefingNpc3[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingNpc3[page] 					= 	{}
		briefingNpc3[page].title			= 	String.Key("briefingNpc3[1].title")
		briefingNpc3[page].text				=	String.Key("briefingNpc3[2].text")
		briefingNpc3[page].position 		= 	GetPosition("npc3")	
		briefingNpc3[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingNpc3[page] 					= 	{}
		briefingNpc3[page].title			= 	String.GenericKey("Erec")
		briefingNpc3[page].text				=	String.Key("briefingNpc3[3].text")
		briefingNpc3[page].position 		= 	GetPosition("Erec")	
		briefingNpc3[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingNpc3[page] 					= 	{}
		briefingNpc3[page].title			= 	String.GenericKey("Dario")
		briefingNpc3[page].text				=	String.Key("briefingNpc3[4].text")
		briefingNpc3[page].position 		= 	GetPosition("Dario")	
		briefingNpc3[page].dialogCamera 	= 	true

	-- xxx set new quest text

		StartBriefing(briefingNpc3)
	
	end


BriefingNpc3Finished = function()

	if IsAlive("npc3_target") then
		MoveAndVanish("npc3", "npc3_target")
	end

	Logic.SetPlayerName(2, String.MainKey.."_PlayerMortfichet")

end