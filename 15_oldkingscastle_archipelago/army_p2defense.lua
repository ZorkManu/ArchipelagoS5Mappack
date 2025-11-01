setupArmyP2Defense = function()

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

	ArmyAIP2Defense1 = UnlimitedArmy:New({
		Player = 2,
		Area = 5000,
		Formation = UnlimitedArmy.Formations.Lines,
		LeaderFormation  = FormationFunktion,
		TransitAttackMove = true,
	})

	ArmyAIP2DefenseRecruiter1 = UnlimitedArmyRecruiter:New(ArmyAIP2Defense1, {
		Buildings = {
			Logic.GetEntityIDByName("Reward2"),
			Logic.GetEntityIDByName("archeryP2"),
			Logic.GetEntityIDByName("foundryP2"),
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
	ArmyAIP2Defense1:AddCommandMove(GetPosition("AI1_ConcentratingArea1"),true)
	ArmyAIP2Defense1:AddCommandWaitForIdle(true)
	ArmyAIP2Defense1:AddCommandDefend(GetPosition("AI1_ConcentratingArea1"), 5000, true)

	ArmyAIP2Defense2 = UnlimitedArmy:New({
		Player = 2,
		Area = 6000,
		Formation = UnlimitedArmy.Formations.Lines,
		LeaderFormation  = FormationFunktion,
		TransitAttackMove = true,
	})

	ArmyAIP2DefenseRecruiter2 = UnlimitedArmyRecruiter:New(ArmyAIP2Defense2, {
		Buildings = {
			Logic.GetEntityIDByName("Reward2"),
			Logic.GetEntityIDByName("archeryP2"),
			Logic.GetEntityIDByName("foundryP2"),
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
	ArmyAIP2Defense2:AddCommandMove(GetPosition("AI1_ConcentratingArea2"),true)
	ArmyAIP2Defense2:AddCommandWaitForIdle(true)
	ArmyAIP2Defense2:AddCommandDefend(GetPosition("AI1_ConcentratingArea2"), 6000, true)

	
	ArmyAIP2Defense3 = UnlimitedArmy:New({
		Player = 2,
		Area = 2000,
		Formation = UnlimitedArmy.Formations.Lines,
		LeaderFormation  = FormationFunktion,
		TransitAttackMove = true,
	})

	ArmyAIP2DefenseRecruiter3 = UnlimitedArmyRecruiter:New(ArmyAIP2Defense3, {
		Buildings = {
			Logic.GetEntityIDByName("Reward2"),
			Logic.GetEntityIDByName("archeryP2"),
			Logic.GetEntityIDByName("foundryP2"),
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
	ArmyAIP2Defense3:AddCommandMove(GetPosition("P2HQDefensePos"),true)
	ArmyAIP2Defense3:AddCommandWaitForIdle(true)
	ArmyAIP2Defense3:AddCommandDefend(GetPosition("P2HQDefensePos"), 2000, true)

end