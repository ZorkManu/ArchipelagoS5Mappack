createArmyAttack2 = function()
    if getArchipelagoDifficultyMultiplier() >= 3 then
        StartSimpleJob("waitForSpawnerCave")
    end
end

function waitForSpawnerCave()
	if Counter.Tick2("waitForSpawnerCave",300) then
		initCaveSpawner(getArchipelagoDifficultyMultiplier())
		return true
	end
end

function initCaveSpawner(_diff)
    local spawnArmyCave = UnlimitedArmy:New({
        Player = 8,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Lines,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerCave = UnlimitedArmySpawnGenerator:New(spawnArmyCave, {
        Position = GetPosition("ConstantAttacker"),
        ArmySize = math.max(4,_diff),
        SpawnCounter = 300,
        SpawnLeaders = math.max(4,_diff),
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(4, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PU_LeaderBow" .. math.min(4, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PU_LeaderCavalry" .. math.min(2, math.max(1, _diff-2))], SoldierNum = 3, SpawnNum = 1, Looped = true, Experience = 0},
			{LeaderType =  Entities["PV_Cannon" .. math.min(4, math.max(1, _diff-2))], SoldierNum = 1, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
end