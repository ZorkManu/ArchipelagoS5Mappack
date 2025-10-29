createArmyBarmeciaDefenders = function()
		BarmeciaRecruiterArmy1 = UnlimitedArmy:New({
			Player = 3,
			Area = 3000,
			Formation = UnlimitedArmy.Formations.Lines,
			LeaderFormation  = FormationFunktion,
			TransitAttackMove = true,
		})

		BarmeciaRecruiter1 = UnlimitedArmyRecruiter:New(BarmeciaRecruiterArmy1, {
			Buildings = {
				Logic.GetEntityIDByName("barrack"),
				Logic.GetEntityIDByName("archery")
			},
			ArmySize = 8,
			UCats = {
				{UCat = UpgradeCategories.LeaderSword, SpawnNum = 3, Looped = true},
            	{UCat = UpgradeCategories.LeaderBow, SpawnNum = 4, Looped = true},
            	{UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
			},
			ResCheat = true
		})
		BarmeciaRecruiterArmy1:AddCommandMove(GetPosition("defenders1"),true)
		BarmeciaRecruiterArmy1:AddCommandWaitForIdle(true)
		BarmeciaRecruiterArmy1:AddCommandDefend(GetPosition("defenders1"), 3000, true)

		BarmeciaRecruiterArmy2 = UnlimitedArmy:New({
			Player = 3,
			Area = 3000,
			Formation = UnlimitedArmy.Formations.Chaotic,
			LeaderFormation  = FormationFunktion,
			TransitAttackMove = true,
		})

		BarmeciaRecruiter2 = UnlimitedArmyRecruiter:New(BarmeciaRecruiterArmy2, {
			Buildings = {
				Logic.GetEntityIDByName("barrack"),
				Logic.GetEntityIDByName("archery")
			},
			ArmySize = 6,
			UCats = {
				{UCat = UpgradeCategories.LeaderSword, SpawnNum = 2, Looped = true},
            	{UCat = UpgradeCategories.LeaderBow, SpawnNum = 4, Looped = true},
			ResCheat = true
			},
		})
		BarmeciaRecruiterArmy2:AddCommandMove(GetPosition("defenders2"),true)
		BarmeciaRecruiterArmy2:AddCommandWaitForIdle(true)
		BarmeciaRecruiterArmy2:AddCommandDefend(GetPosition("defenders2"), 3000, true)
	end
	
	