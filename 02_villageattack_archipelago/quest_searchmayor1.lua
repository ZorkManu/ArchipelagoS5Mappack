QUEST_DELAY 		= 300	-- Time when searchMayor1-mission atomatically ends
QUEST_COUNTER 		=	QUEST_DELAY 



createQuestSearchMayor1 = function()

	InitNPCLookAt("Mayor_north")

--	StartJob("QuestPlayerDoesnotGo")

	end




destroyQuestSearchMayor1 = function()

	DisableNpcMarker("Mayor_north")

	endQuestSearchMayor1()
	
end




-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestPlayerDoesnotGo"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestPlayerDoesnotGo = function()
	-------------------------------------------------------------------------------------------------------------------

		if Counter.Tick2("QuestPlayerDoesnotGo",QUEST_DELAY) then
			
			return true

		end
		
		
		
		QUEST_COUNTER = QUEST_COUNTER - 1
		Report("Continue in : "..QUEST_COUNTER.." seconds")        
					
		return false
		
	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestPlayerDoesnotGo = function()
	-------------------------------------------------------------------------------------------------------------------

		npc_mayorNorth = 1
	
		destroyQuestSearchMayor1()	

		createBriefingSupportVillageGoOn()

		return true
		
	end
