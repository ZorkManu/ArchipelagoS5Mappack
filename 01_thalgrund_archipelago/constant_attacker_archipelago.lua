function initConstantAttacker()
    local diff = getArchipelagoDifficultyMultiplier()
    if diff >= 2 then
        StartSimpleJob("waitForSpawnerCave")
    end
    if diff >= 3 then
        StartSimpleJob("waitForSpawnerMainCamp")
    end
    if diff >= 4 then
        local towerPos = GetPosition("ConstantAttackSpawner")
        Logic.SetEntityName(Logic.CreateEntity( Entities.CB_Bastille1, towerPos.X, towerPos.Y, 0, 7 ),"attackSpawner")
        StartSimpleJob("waitForSpawnerTower")
    end
end

function waitForSpawnerCave()
    if Counter.Tick2("waitForSpawnerCave", 500) then
        initCaveSpawner(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerMainCamp()
    if Counter.Tick2("waitForSpawnerMainCamp", 700) then
        initMainCampSpawner(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerTower()
    if Counter.Tick2("waitForSpawnerTower", 300) then
        initTowerSpawner(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function initCaveSpawner(_diff)
    local spawnArmyCave = UnlimitedArmy:New({
        Player = 7,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerCave = UnlimitedArmySpawnGenerator:New(spawnArmyCave, {
        Position = GetPosition("ConstantAttacker1"),
        ArmySize = math.max(4,_diff),
        SpawnCounter = 500,
        SpawnLeaders = math.max(4,_diff),
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PU_LeaderBow" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PU_LeaderCavalry" .. math.min(2, math.max(1, _diff-2))], SoldierNum = 3, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyCave:AddCommandMove(GetPosition("Entrance2"),true)
    spawnArmyCave:AddCommandWaitForIdle(true)
    spawnArmyCave:AddCommandMove(GetPosition("armyAttackPoint"),true)
    spawnArmyCave:AddCommandWaitForIdle(true)
    spawnArmyCave:AddCommandLuaFunc(increaseEnemySoldiersCave,true)
end

function initMainCampSpawner(_diff)
    local spawnArmyMainCamp = UnlimitedArmy:New({
        Player = 7,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
    })
    SpawnerMainCamp = UnlimitedArmySpawnGenerator:New(spawnArmyMainCamp, {
        Position = GetPosition("bossFight"),
        ArmySize = math.max(4,_diff),
        SpawnCounter = 600,
        SpawnLeaders = math.max(4,_diff),
        Generator = "Jail",
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PU_LeaderBow" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PV_Cannon" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 0, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyMainCamp:AddCommandLuaFunc(increaseEnemySoldiersMainCamp,true)
end

function initTowerSpawner(_diff)
    local spawnArmyTower = UnlimitedArmy:New({
        Player = 7,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
    })
    SpawnerTower = UnlimitedArmySpawnGenerator:New(spawnArmyTower, {
        Position = GetPosition("ConstantAttacker2"),
        ArmySize = math.max(4,_diff),
        SpawnCounter = 800,
        SpawnLeaders = math.max(4,_diff),
        Generator = "attackSpawner",
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderPoleArm" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entities["PU_LeaderSword" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entities.PU_LeaderRifle1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyTower:AddCommandLuaFunc(increaseEnemySoldiersTower,true)
end

function increaseEnemySoldiersCave(self)
    if Modulo(math.floor(Logic.GetTime()),800) == 0 then
        self.Spawner.ArmySize = self.Spawner.ArmySize +1
        self.Spawner.SpawnLeaders = self.Spawner.SpawnLeaders +1
    end
end

function increaseEnemySoldiersMainCamp(self)
    if Modulo(math.floor(Logic.GetTime()),800) == 0 then
        self.Spawner.ArmySize = self.Spawner.ArmySize +1
        self.Spawner.SpawnLeaders = self.Spawner.SpawnLeaders +1
    end
end

function increaseEnemySoldiersTower(self)
    if Modulo(math.floor(Logic.GetTime()),800) == 0 then
        self.Spawner.ArmySize = self.Spawner.ArmySize +1
        self.Spawner.SpawnLeaders = self.Spawner.SpawnLeaders +1
    end
end