createQuestDefendCountessVillage = function()

	-- Check for village or hq lost
	StartJob("CountessVillageLost")

--TK Dorf dauerhaft aufklären
--	Logic.SetEntityExplorationRange("VillagePosition2", 6000)

	Explore.Show("VillagePosition2", "VillagePosition2", 6000)
	

end

Condition_CountessVillageLost = function()

	-- Village Center or HQ lost
	return (IsDead("CountessVillageCenter") or IsDead("CountessVillageHQ")) and IsBriefingActive() ~= true

end

Action_CountessVillageLost = function()
	
	Defeat()
	return true
end