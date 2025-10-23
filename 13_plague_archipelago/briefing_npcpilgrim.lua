
createBriefingNpcPilgrim = function()

	DisableNpcMarker("npcPilgrim")

	briefingNpcPilgrim = {}	
	

		local page = 0

	--	page
	
		page = page +1
	
		briefingNpcPilgrim[page] 				= 	{}
		briefingNpcPilgrim[page].title			= 	String.GenericKey("Villager")
		briefingNpcPilgrim[page].text			=	String.Key("briefingNpcPilgrim[1].text")
		briefingNpcPilgrim[page].position 		= 	GetPosition("npcPilgrim")	
		briefingNpcPilgrim[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingNpcPilgrim[page] 				= 	{}
		briefingNpcPilgrim[page].title			= 	String.GenericKey("Villager")
		briefingNpcPilgrim[page].text			=	String.Key("briefingNpcPilgrim[2].text")
		briefingNpcPilgrim[page].position 		= 	GetPosition("PilgrimNPC")	
		briefingNpcPilgrim[page].dialogCamera 	= 	true

	--	page

		page = page +1
	
		briefingNpcPilgrim[page] 				= 	{}
		briefingNpcPilgrim[page].title			= 	String.GenericKey("Villager")
		briefingNpcPilgrim[page].text			=	String.Key("briefingNpcPilgrim[3].text")
		briefingNpcPilgrim[page].position 		= 	GetPosition("npcPilgrim")	
		briefingNpcPilgrim[page].dialogCamera 	= 	true

	-- go!

		StartBriefing(briefingNpcPilgrim)
	
	end




-------------------------------------------------------------------------------------------------------------
createBriefingNpcPilgrim_Failed = function()

	DisableNpcMarker("npcPilgrim")

	briefingNpcPilgrim_Failed = {}	

	briefingNpcPilgrim_Failed.finished =  BriefingNpcPilgrim_Failed


		local page = 0

	--	page
	
		page = page +1
	
		briefingNpcPilgrim_Failed[page] 				= 	{}
		briefingNpcPilgrim_Failed[page].title			= 	String.GenericKey("Villager")
		briefingNpcPilgrim_Failed[page].text			=	String.Key("briefingNpcPilgrim_Failed[1].text")
		briefingNpcPilgrim_Failed[page].position 		= 	GetPosition("npcPilgrim")	
		briefingNpcPilgrim_Failed[page].dialogCamera 	= 	true

	--	go!

		StartBriefing(briefingNpcPilgrim_Failed)
	
	end





BriefingNpcPilgrim_Failed = function()

	StartJob("NPC_Pilgrim_Leave")
	
end



-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "NPC_Pilgrim_Leave"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_NPC_Pilgrim_Leave = function()
	-------------------------------------------------------------------------------------------------------------------
		return  Counter.Tick2("Dummy", 10)
	end

		
	-------------------------------------------------------------------------------------------------------------------
	Action_NPC_Pilgrim_Leave = function()
	-------------------------------------------------------------------------------------------------------------------
		if IsAlive("npcPilgrim_target") and IsAlive("npcPilgrim")then
			ChangePlayer("npcPilgrim", 4)
	
			local NPC = GetID("npcPilgrim")
			MoveAndVanish(NPC, "npcPilgrim_target")
		end

		return true
	end
-----------------------------------------------------------------------------------------------------------------------
