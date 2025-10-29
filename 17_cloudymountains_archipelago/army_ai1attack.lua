setupArmyAI1Attack = function()

	ArmyAI1Attack = UnlimitedArmy:New({
		Player = 5,
		Area = 6000,
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

	ArmyAI1AttackRecruiter = UnlimitedArmyRecruiter:New(ArmyAI1Attack, {
		Buildings = {
			Logic.GetEntityIDByName("barracks"),
			Logic.GetEntityIDByName("archery"),
			Logic.GetEntityIDByName("foundry1"),
			Logic.GetEntityIDByName("foundry2"),
		},
		ArmySize = 5 + diff,
		UCats = {
			{UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderBow, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
			{UCat = cannonCategory, SpawnNum = 1, Looped = true},
		},
		ResCheat = true
	})
	ArmyAI1Attack:AddCommandMove(GetPosition("AI1_Defend_Iron"),true)
	ArmyAI1Attack:AddCommandWaitForIdle(true)
	ArmyAI1Attack:AddCommandAttackNearestTarget(60000,true)
	end
-----------------------------------------------------------------------------------------------------------------------
