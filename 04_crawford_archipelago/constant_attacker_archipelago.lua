function initConstantAttacker()
    local diff = getArchipelagoDifficultyMultiplier()
    if diff >= 3 then
        StartSimpleJob("waitForSpawnerTower1Player")
        StartSimpleJob("waitForSpawnerTower2Player")
    end
    if diff >= 5 then
        StartSimpleJob("waitForSpawnerTower2Crawford")
        StartSimpleJob("waitForSpawnerTower2Crawford")
    end
end

function waitForSpawnerTower1Player()
    if Counter.Tick2("waitForSpawnerTower1Player", 300) then
        initTower1Player(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerTower1Crawford()
    if Counter.Tick2("waitForSpawnerTower1Crawford", 500) then
        initSpawnerTower1Crawford(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerTower2Player()
    if Counter.Tick2("waitForSpawnerTower2Player", 700) then
        initSpawnerTower2Player(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerTower2Crawford()
    if Counter.Tick2("waitForSpawnerTower2Crawford", 900) then
        initSpawnerTower2Crawford(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function initTower1Player(_diff)
    spawnArmyTower1Player = UnlimitedArmy:New({
        Player = 5,
        Area = 2000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerTower1Player = UnlimitedArmySpawnGenerator:New(spawnArmyTower1Player, {
        Position = GetPosition("spawn1"),
        ArmySize = 3*_diff,
        SpawnCounter = 500,
        SpawnLeaders = 3*_diff,
        Generator = "tower1a",
        LeaderDesc = {
            {LeaderType = Entities.CU_BlackKnight_LeaderMace1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities.CU_BanditLeaderBow1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP2"),true)
    spawnArmyTower1Player:AddCommandWaitForIdle(true)
    spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP3"),true)
    spawnArmyTower1Player:AddCommandWaitForIdle(true)
    spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP5"),true)
    spawnArmyTower1Player:AddCommandWaitForIdle(true)
    --spawnArmyTower1Player:AddCommandLuaFunc(waypointCheckIronMine,true)
    if math.random() < 0.5 then
        spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP12"))
        spawnArmyTower1Player:AddCommandWaitForIdle()
    else
        spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP6"))
        spawnArmyTower1Player:AddCommandWaitForIdle()
        spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP7"))
        spawnArmyTower1Player:AddCommandWaitForIdle()
    end
    spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP10"),true)
    spawnArmyTower1Player:AddCommandWaitForIdle(true)
    spawnArmyTower1Player:AddCommandMove(GetPosition("attSpawnPoint3_SA"),true)
    spawnArmyTower1Player:AddCommandWaitForIdle(true)
    spawnArmyTower1Player:AddCommandMove(GetPosition("CutsceneIntroDario2"),true)
    spawnArmyTower1Player:AddCommandWaitForIdle(true)
    spawnArmyTower1Player:AddCommandAttackNearestTarget(30000,true)
    StartSimpleJob("increaseEnemySoldiersTower1Player")
end

function waypointCheckIronMine()
    if math.random() < 0.5 then
        spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP12"))
        spawnArmyTower1Player:AddCommandWaitForIdle()
    else
        spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP6"))
        spawnArmyTower1Player:AddCommandWaitForIdle()
        spawnArmyTower1Player:AddCommandMove(GetPosition("patrol1_WP7"))
        spawnArmyTower1Player:AddCommandWaitForIdle()
    end
end

function initSpawnerTower1Crawford(_diff)
    local spawnArmyTower1Crawford = UnlimitedArmy:New({
        Player = 5,
        Area = 2000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerTower1Crawford = UnlimitedArmySpawnGenerator:New(spawnArmyTower1Crawford, {
        Position = GetPosition("spawn1"),
        ArmySize = 3*_diff,
        SpawnCounter = 500,
        SpawnLeaders = 3*_diff,
        Generator = "tower1b",
        LeaderDesc = {
            {LeaderType = Entities.CU_BlackKnight_LeaderMace1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities.CU_BanditLeaderBow1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyTower1Crawford:AddCommandMove(GetPosition("attWayPoint4_OO1"),true)
    spawnArmyTower1Crawford:AddCommandWaitForIdle(true)
    spawnArmyTower1Crawford:AddCommandAttackNearestTarget(80000,true)
    StartSimpleJob("increaseEnemySoldiersTower1Crawford")
end

function initSpawnerTower2Player(_diff)
    spawnArmyTower2Player = UnlimitedArmy:New({
        Player = 5,
        Area = 2000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerTower2Player = UnlimitedArmySpawnGenerator:New(spawnArmyTower2Player, {
        Position = GetPosition("spawn2"),
        ArmySize = 3*_diff,
        SpawnCounter = 500,
        SpawnLeaders = 3*_diff,
        Generator = "tower2a",
        LeaderDesc = {
            {LeaderType = Entities.CU_BlackKnight_LeaderMace1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities.CU_BanditLeaderBow1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    if math.random() < 0.5 then
        spawnArmyTower2Player:AddCommandMove(GetPosition("patrol3_WP3"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("patrol3_WP6"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("patrol3_WP9"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("attSpawnPoint5_SDA"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("checkP1inSDB_3"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
    else
        spawnArmyTower2Player:AddCommandMove(GetPosition("attWayPoint3_OO2"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("attWayPoint4_OO2"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("attTargetArea4_SDB"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
    end
    --spawnArmyTower2Player:AddCommandLuaFunc(waypointCheckAttackPlayer,true)
    spawnArmyTower2Player:AddCommandAttackNearestTarget(30000,true)
    StartSimpleJob("increaseEnemySoldiersTower2Player")
end

function waypointCheckAttackPlayer()
    if math.random() < 0.5 then
        spawnArmyTower2Player:AddCommandMove(GetPosition("patrol3_WP3"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("patrol3_WP6"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("patrol3_WP9"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("attSpawnPoint5_SDA"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("checkP1inSDB_3"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
    else
        spawnArmyTower2Player:AddCommandMove(GetPosition("attWayPoint3_OO2"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("attWayPoint4_OO2"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
        spawnArmyTower2Player:AddCommandMove(GetPosition("attTargetArea4_SDB"))
        spawnArmyTower2Player:AddCommandWaitForIdle()
    end
end

function initSpawnerTower2Crawford(_diff)
    local spawnArmyTower2Crawford = UnlimitedArmy:New({
        Player = 5,
        Area = 2000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerTower2Crawford = UnlimitedArmySpawnGenerator:New(spawnArmyTower2Crawford, {
        Position = GetPosition("spawn2"),
        ArmySize = 3*_diff,
        SpawnCounter = 500,
        SpawnLeaders = 3*_diff,
        Generator = "tower2b",
        LeaderDesc = {
            {LeaderType = Entities.CU_BlackKnight_LeaderMace1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities.CU_BanditLeaderBow1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyTower2Crawford:AddCommandMove(GetPosition("attWayPoint3_OO2"),true)
    spawnArmyTower2Crawford:AddCommandWaitForIdle(true)
    spawnArmyTower2Crawford:AddCommandMove(GetPosition("attWayPoint5_OO2"),true)
    spawnArmyTower2Crawford:AddCommandWaitForIdle(true)
    spawnArmyTower2Crawford:AddCommandAttackNearestTarget(80000,true)
    StartSimpleJob("increaseEnemySoldiersTower2Crawford")
end

function increaseEnemySoldiersTower1Player()
    if Counter.Tick2("increaseEnemySoldiersTower1Player",1200-getArchipelagoDifficultyMultiplier()*30) then
		if IsDead("tower1a") and IsDead("tower1b") then
			return true
		end
        SpawnerTower1Player.ArmySize = SpawnerTower1Player.ArmySize +3
        SpawnerTower1Player.SpawnLeaders = SpawnerTower1Player.SpawnLeaders +3
    end
end

function increaseEnemySoldiersTower1Crawford()
    if Counter.Tick2("increaseEnemySoldiersTower1Crawford",1200-getArchipelagoDifficultyMultiplier()*30) then
		if IsDead("tower1a") and IsDead("tower1b") then
			return true
		end
        SpawnerTower1Crawford.ArmySize = SpawnerTower1Crawford.ArmySize +3
        SpawnerTower1Crawford.SpawnLeaders = SpawnerTower1Crawford.SpawnLeaders +3
    end
end

function increaseEnemySoldiersTower2Player()
    if Counter.Tick2("increaseEnemySoldiersTower2Player",1200-getArchipelagoDifficultyMultiplier()*30) then
		if IsDead("tower2a") and IsDead("tower2b") then
			return true
		end
        SpawnerTower2Player.ArmySize = SpawnerTower2Player.ArmySize +3
        SpawnerTower2Player.SpawnLeaders = SpawnerTower2Player.SpawnLeaders +3
    end
end

function increaseEnemySoldiersTower2Crawford()
    if Counter.Tick2("increaseEnemySoldiersTower2Crawford",1200-getArchipelagoDifficultyMultiplier()*30) then
		if IsDead("tower2a") and IsDead("tower2b") then
			return true
		end
        SpawnerTower2Crawford.ArmySize = SpawnerTower2Crawford.ArmySize +3
        SpawnerTower2Crawford.SpawnLeaders = SpawnerTower2Crawford.SpawnLeaders +3
    end
end