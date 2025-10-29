setupArmyAI1Defense = function()

	ArmyAI1Defense = UnlimitedArmy:New({
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

	ArmyAI1DefenseRecruiter = UnlimitedArmyRecruiter:New(ArmyAI1Defense, {
		Buildings = {
			Logic.GetEntityIDByName("barracks"),
			Logic.GetEntityIDByName("archery"),
			Logic.GetEntityIDByName("foundry1"),
			Logic.GetEntityIDByName("foundry2"),
		},
		ArmySize = 3 + diff,
		UCats = {
			{UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderBow, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
			{UCat = cannonCategory, SpawnNum = 1, Looped = true},
		},
		ResCheat = true
	})
	ArmyAI1Defense:AddCommandMove(GetPosition("AI1_DefensePos"),true)
	ArmyAI1Defense:AddCommandWaitForIdle(true)
	ArmyAI1Defense:AddCommandDefend(GetPosition("AI1_DefensePos"), 6000, true)
end