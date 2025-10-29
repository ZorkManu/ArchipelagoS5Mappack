createArmyAttack1 = function()

	local _diff = getArchipelagoDifficultyMultiplier()

	local armyAttack = UnlimitedArmy:New({
        Player = 8,
        Area = 50,
        Formation = UnlimitedArmy.Formations.Lines,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
	local _armySize =  math.floor(_diff/2)
    SpawnerTower = UnlimitedArmySpawnGenerator:New(armyAttack, {
        Position = GetPosition("army2"),
        ArmySize = 3 + _armySize,
        SpawnCounter = 30,
        SpawnLeaders = 3 + _armySize,
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(4, math.max(1, _diff-1))], SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
        },
		Generator = "tower1",
    })
	armyAttack:AddCommandMove(GetPosition("defenders2"), true)
	armyAttack:AddCommandWaitForIdle(true)
	armyAttack:AddCommandMove(GetPosition("attackBarmecia"), true)
	armyAttack:AddCommandWaitForIdle(true)
	armyAttack:AddCommandAttackNearestTarget(14000,true)
	if _diff > 2 then
		StartSimpleJob("increaseEnemySoldiersTower")
	end

	local armyDefend = UnlimitedArmy:New({
        Player = 8,
        Area = 50,
        Formation = UnlimitedArmy.Formations.Lines,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerTowerDefend = UnlimitedArmySpawnGenerator:New(armyDefend, {
        Position = GetPosition("army3"),
        ArmySize = 3 + _armySize,
        SpawnCounter = 30,
        SpawnLeaders = 3,
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(4, math.max(1, _diff-1))], SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
        },
		Generator = "tower2",
    })
	armyDefend:AddCommandDefend(GetPosition("army3"),4000)

	local armyDefendIronMine = UnlimitedArmy:New({
        Player = 8,
        Area = 50,
        Formation = UnlimitedArmy.Formations.Lines,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerTowerDefend = UnlimitedArmySpawnGenerator:New(armyDefendIronMine, {
        Position = GetPosition("army3"),
        ArmySize = 3 + _diff,
        SpawnCounter = 30,
        SpawnLeaders = 3 + _diff,
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(4, math.max(1, _diff-1))], SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
			{LeaderType = Entities["PU_LeaderBow" .. math.min(4, math.max(1, _diff-1))], SoldierNum = 8, SpawnNum = 1, Looped = true, Experience = 0},
        },
		Generator = "tower2",
    })
	armyDefendIronMine:AddCommandMove(GetPosition("guardIronMine"), true)
	armyDefendIronMine:AddCommandWaitForIdle(true)
end

function increaseEnemySoldiersTower()
    if Counter.Tick2("increaseEnemySoldiersTower",600-getArchipelagoDifficultyMultiplier()*30) then
		if IsDead("tower2") then
			return true
		end
        SpawnerTower.ArmySize = SpawnerTower.ArmySize +1
        SpawnerTower.SpawnLeaders = SpawnerTower.SpawnLeaders +1
    end
end