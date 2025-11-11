setupArmyAI2Attack = function()

	ArmyAI2Attack = UnlimitedArmy:New({
		Player = 2,
		Area = 3000,
		Formation = UnlimitedArmy.Formations.Lines,
		LeaderFormation  = FormationFunktion,
		TransitAttackMove = true,
	})

	local diff = getArchipelagoDifficultyMultiplier()

	ArmyAI2AttackRecruiter = UnlimitedArmyRecruiter:New(ArmyAI2Attack, {
		Buildings = {
			Logic.GetEntityIDByName("KI2_Target2"),
			Logic.GetEntityIDByName("KI2_Target3"),
			Logic.GetEntityIDByName("KI2_Target4"),
		},
		ArmySize = 6 + diff,
		UCats = {
			{UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderBow, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderCavalry, SpawnNum = 1, Looped = true},
		},
		ResCheat = true
	})
	ArmyAI2Attack:AddCommandMove(GetPosition("KI2_Defense"),true)
	ArmyAI2Attack:AddCommandWaitForIdle(true)
    ArmyAI2Attack:AddCommandMove(GetPosition("ki2movepoint1"),true)
	ArmyAI2Attack:AddCommandWaitForIdle(true)
    ArmyAI2Attack:AddCommandMove(GetPosition("ki2movepoint2"),true)
	ArmyAI2Attack:AddCommandWaitForIdle(true)
    ArmyAI2Attack:AddCommandMove(GetPosition("PlayerPosition"),true)
	ArmyAI2Attack:AddCommandWaitForIdle(true)
	ArmyAI2Attack:AddCommandAttackNearestTarget(80000,true)
end