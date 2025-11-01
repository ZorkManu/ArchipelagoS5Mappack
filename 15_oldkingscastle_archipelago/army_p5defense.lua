setupArmyP5Defense = function()

	ArmyAttackP5= UnlimitedArmy:New({
		Player = 5,
		Area = 4000,
		Formation = UnlimitedArmy.Formations.Lines,
		LeaderFormation  = FormationFunktion,
		TransitAttackMove = true,
	})

	local diff = getArchipelagoDifficultyMultiplier()
	local cannonCategory = UpgradeCategories.Cannon1
	if diff > 2 then
		cannonCategory = UpgradeCategories.Cannon2
		if diff > 3 then
			cannonCategory = UpgradeCategories.Cannon3
			if diff > 4 then
				cannonCategory = UpgradeCategories.Cannon4
			end
		end
	end

	ArmyAttackP5Recruiter = UnlimitedArmyRecruiter:New(ArmyAttackP5, {
		Buildings = {
			Logic.GetEntityIDByName("barracksP5"),
			Logic.GetEntityIDByName("Reward5"),
			Logic.GetEntityIDByName("foundryP5"),
			Logic.GetEntityIDByName("stableP5"),
		},
		ArmySize = 7 + diff,
		UCats = {
			{UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderBow, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
			{UCat = cannonCategory, SpawnNum = 1, Looped = true},
		},
		ResCheat = true
	})
	ArmyAttackP5:AddCommandMove(GetPosition("AI2_ConcentratingArea"),true)
	ArmyAttackP5:AddCommandWaitForIdle(true)
	ArmyAttackP5:AddCommandDefend(GetPosition("AI2_ConcentratingArea"), 5000)
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP5Defense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP5Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP5Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP5Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP5Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
