setupArmyAI2 = function()
	local diff = getArchipelagoDifficultyMultiplier()
	local techlevel = 3
	if diff > 3 then
		techlevel = 4
	end

	local armyDefend = UnlimitedArmy:New({
        Player = 2,
        Area = 6000,
        Formation = UnlimitedArmy.Formations.Lines,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerHQDefend = UnlimitedArmySpawnGenerator:New(armyDefend, {
        Position = GetPosition("AI2_ConcentratingArea"),
        ArmySize = 3 + diff,
        SpawnCounter = 30,
        SpawnLeaders = 3,
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. techlevel], SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
			{LeaderType = Entities["PU_LeaderPoleArm" .. techlevel], SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
			{LeaderType = Entities["PU_LeaderBow" .. techlevel], SoldierNum = 8, SpawnNum = 2, Looped = true, Experience = 0},
			{LeaderType = Entities["PV_Cannon" .. techlevel], SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
        },
		Generator = "HQ_AI2",
    })
	armyDefend:AddCommandDefend(GetPosition("AI2_ConcentratingArea"),6000)

end