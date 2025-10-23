
LEONARDO_FREED = 0

--

createQuestRescueLeonardo = function()

	StartJob("QuestRescueLeo")

end



	
destroyQuestRescueLeonardo = function()

	DisableNpcMarker("Leonardo")

end



	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestRescueLeo"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestRescueLeo = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if Counter.Tick2("QuestRescueLeo",3) then

			return IsDead(armyDefendCamp1) --and IsDead("tower1")
		
		end
		
	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestRescueLeo = function()
	-------------------------------------------------------------------------------------------------------------------
		
		ResolveBriefing(briefingDefendCastle[page_rescueLeonardo])
		
		Logic.DestroyEntity(Logic.GetEntityIDByName("Leonardo_Gate"))

		for i=1, 5, 1 do		
			
			ChangePlayer("hostage"..i, GetHumanPlayer())
			
			Move("hostage"..i,"castle")
			
		end
			
		InitNPCLookAt("Leonardo")
		
		Move("Leonardo",getLeadingHero())
		SetNPCFollow("Leonardo", 1, 750)
		
		LEONARDO_FREED = 1
		
		return true
		
	end


