createQuestCountessVillageTributePaid = function()

--TK
	-- Wait for empty construction plan
	StartJob("WaitForConstructionComplete")

	-- Give resources to player 4
	Tools.GiveResouces(4, 0, 800, 1000)

	-- Setup new refresh data
	AI.Player_SetResourceRefreshRates(4, 20, 20, 0, 0, 20, 20, 10)
end

Condition_WaitForConstructionComplete = function()

--	return AI.Village_ConstructionQueueIsEmpty(4) == 1 or Counter.Tick2("Dummy", 600)
	return AI.Village_ConstructionQueueIsEmpty(4) == 1 and IsBriefingActive() ~= true

end

Action_WaitForConstructionComplete = function()

	-- Quest done
	end3rdQuest()
	
	return true
end