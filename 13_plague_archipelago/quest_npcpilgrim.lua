
NPC_PilgrimTributePaid = -1

----------------------------------------
startQuestNpcPilgrim = function()

	InitNPCLookAt("npcPilgrim")

end



endQuestNpcPilgrim = function()

	DisableNpcMarker("npcPilgrim")

	createBriefingNpcPilgrim()

	if GetPlayer("PilgrimNPC") == GetHumanPlayer() then
	
		createBriefingNpcPilgrim_Failed()
	
		return
	
	end

	local job = {}
	
	job.Tribute = tributeCounter
	
	tributeCounter = tributeCounter+1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_ShowPilgrim",  
						ResourceType.Gold, 
						100 )

	job.Callback 	= executeQuestPilgrim

	SetupTributePaid(job)

end




executeQuestPilgrim = function()

	NPC_PilgrimTributePaid = 1

	if GetPlayer("Pilgrim") == GetHumanPlayer() then
	
		createBriefingNpcPilgrim_Failed()
	
		return
	
	end


	-- set camera to NPC
		local IDPosX, IDPosY, IDPosZ = 	Tools.GetPosition("npcPilgrim")
		Camera.ScrollSetLookAt(IDPosX, IDPosY)	

	Move("npcPilgrim","Pilgrim")

	-- does not work :-(
	-- StartJob("QuestRunToPilgrim")
	
	StartJob("PilgrimReached")
	
end




-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestRunToPilgrim"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestRunToPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestRunToPilgrim = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsDead("npcPilgrim") then
		
			return true
			
		end

		if IsNear("npcPilgrim","Pilgrim",600) then
		
			return true
			
		end
			
		if GetPlayer("Pilgrim") == GetHumanPlayer() then
		
			return true
			
		end
			
		GUI.CreateMinimapPulse(GetPosition("npcPilgrim").X,GetPosition("npcPilgrim").Y,1)					

		return false
		
	end
	




-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "PilgrimReached"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_PilgrimReached = function()
	-------------------------------------------------------------------------------------------------------------------
	
		if IsDead("npcPilgrim") then
			return true
		end

		if GetPlayer("Pilgrim") == GetHumanPlayer() then
			return true
		end
		
		if IsNear("npcPilgrim","Pilgrim",600) ~= true then
			Move("npcPilgrim","Pilgrim")
		end
		
		return IsNear("npcPilgrim","Pilgrim",500)
		
	end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_PilgrimReached = function()
	-------------------------------------------------------------------------------------------------------------------

		Report("Ziel erreicht!")
		
		return true
	end
