function initConstantAttacker()
    local diff = getArchipelagoDifficultyMultiplier()
    if diff >= 2 then
        StartSimpleJob("waitForSpawnerUpperCamp")
        StartSimpleJob("waitForSpawnerLowerCamp")
    end
    if diff >= 4 then
        StartSimpleJob("waitForSpawnerLeftVillage")
        StartSimpleJob("upgradesSpawner")
    end
    if diff >= 5 then
        StartSimpleJob("waitForSpawnerRightVillage")
    end
    if diff >= 6 then
        local campPos = GetPosition("spawnerMountain")
        Logic.SetEntityName(Logic.CreateEntity( Entities.CB_Camp01, campPos.X, campPos.Y, 0, 7 ),"mountainTent")
        StartSimpleJob("waitForSpawnerMountains")
    end
end

function waitForSpawnerUpperCamp()
    if Counter.Tick2("waitForSpawnerUpperCamp", 400) then
        initSpawnerUpperCamp(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerLowerCamp()
    if Counter.Tick2("waitForSpawnerLowerCamp", 600) then
        initSpawnerLowerCamp(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerLeftVillage()
    if Counter.Tick2("waitForSpawnerLeftVillage", 300) then
        initSpawnerLeftVillage(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerRightVillage()
    if Counter.Tick2("waitForSpawnerRightVillage", 600) then
        initSpawnerRightVillage(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function waitForSpawnerMountains()
    if Counter.Tick2("waitForSpawnerMountains", 200) then
        initSpawnerMountains(getArchipelagoDifficultyMultiplier())
        return true
    end
end

function initSpawnerUpperCamp(_diff)
    local spawnArmyUpperCamp = UnlimitedArmy:New({
        Player = 2,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerUpperCamp = UnlimitedArmySpawnGenerator:New(spawnArmyUpperCamp, {
        Position = GetPosition("guard1"),
        ArmySize = _diff*2,
        SpawnCounter = 500,
        SpawnLeaders = _diff*2,
        Generator = "tower1",
        LeaderDesc = {
            {LeaderType = Entities.CU_BlackKnight_LeaderMace1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entities.CU_BanditLeaderSword1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entities.CU_BanditLeaderBow1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyUpperCamp:AddCommandMove(GetPosition("hawk"),true)
    spawnArmyUpperCamp:AddCommandWaitForIdle(true)
    spawnArmyUpperCamp:AddCommandMove(GetPosition("eastEntrance"),true)
    spawnArmyUpperCamp:AddCommandWaitForIdle(true)
    spawnArmyUpperCamp:AddCommandAttackNearestTarget(5000,true)
end

function initSpawnerLowerCamp(_diff)
    local spawnArmyLowerCamp = UnlimitedArmy:New({
        Player = 2,
        Area = 5000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
    })
    SpawnerMainCamp = UnlimitedArmySpawnGenerator:New(spawnArmyLowerCamp, {
        Position = GetPosition("GoldChest6"),
        ArmySize = math.max(4,_diff),
        SpawnCounter = 600,
        SpawnLeaders = math.max(4,_diff),
        Generator = "tower2",
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(3, math.max(1, _diff-2))], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyLowerCamp:AddCommandMove(GetPosition("hawk"),true)
    spawnArmyLowerCamp:AddCommandWaitForIdle(true)
    spawnArmyLowerCamp:AddCommandMove(GetPosition("robbers1"),true)
    spawnArmyLowerCamp:AddCommandWaitForIdle(true)
    spawnArmyLowerCamp:AddCommandMove(GetPosition("robbers2"),true)
    spawnArmyLowerCamp:AddCommandWaitForIdle(true)
    spawnArmyLowerCamp:AddCommandMove(GetPosition("robbers3"),true)
    spawnArmyLowerCamp:AddCommandWaitForIdle(true)
    spawnArmyLowerCamp:AddCommandAttackNearestTarget(5000,true)
end

function initSpawnerLeftVillage(_diff)
    local spawnArmyLeftVillage = UnlimitedArmy:New({
        Player = 2,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
    })
    local cavLevel = 1
    if _diff > 5 then
        cavLevel = 2
    end
    SpawnerLeftVillage = UnlimitedArmySpawnGenerator:New(spawnArmyLeftVillage, {
        Position = GetPosition("cave1"),
        ArmySize = 4,
        SpawnCounter = 800,
        SpawnLeaders = 4,
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderHeavyCavalry" .. cavLevel], SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyLeftVillage:AddCommandMove(GetPosition("deploy1A"),true)
    spawnArmyLeftVillage:AddCommandWaitForIdle(true)
    spawnArmyLeftVillage:AddCommandMove(GetPosition("Hint_Mayor_North2"),true)
    spawnArmyLeftVillage:AddCommandWaitForIdle(true)
    spawnArmyLeftVillage:AddCommandMove(GetPosition("northEntrance"),true)
    spawnArmyLeftVillage:AddCommandWaitForIdle(true)
    spawnArmyLeftVillage:AddCommandAttackNearestTarget(5000,true)
end

function initSpawnerRightVillage(_diff)
    local spawnArmyRightVillage = UnlimitedArmy:New({
        Player = 2,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
    })
    SpawnerRightVillage = UnlimitedArmySpawnGenerator:New(spawnArmyRightVillage, {
        Position = GetPosition("cave2"),
        ArmySize = 12,
        SpawnCounter = 500,
        SpawnLeaders = 12,
        Leader = {
            {LeaderType = Entities.CU_BlackKnight_LeaderMace1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entiities.CU_BanditLeaderSword1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType = Entiities.CU_BanditLeaderBow1, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })
    spawnArmyRightVillage:AddCommandMove(GetPosition("VictoryErecMove"),true)
    spawnArmyRightVillage:AddCommandWaitForIdle(true)
    spawnArmyRightVillage:AddCommandMove(GetPosition("Hint_Mayor_East"),true)
    spawnArmyRightVillage:AddCommandWaitForIdle(true)
    if math.random(0,1) then
        spawnArmyRightVillage:AddCommandMove(GetPosition("northEntrance"),true)
        spawnArmyRightVillage:AddCommandWaitForIdle(true)
    else
        spawnArmyRightVillage:AddCommandMove(GetPosition("villageway"),true)
        spawnArmyRightVillage:AddCommandWaitForIdle(true)
        spawnArmyRightVillage:AddCommandMove(GetPosition("eastEntrance"),true)
        spawnArmyRightVillage:AddCommandWaitForIdle(true)
    end
    spawnArmyRightVillage:AddCommandWaitForIdle(true)
    spawnArmyRightVillage:AddCommandAttackNearestTarget(5000,true)
end

function initSpawnerMountains(_diff)
    local spawnArmyMountains = UnlimitedArmy:New({
        Player = 2,
        Area = 25000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
    })
    SpawnerMountains = UnlimitedArmySpawnGenerator:New(spawnArmyMountains, {
        Position = GetPosition("cave1"),
        ArmySize = 3,
        SpawnCounter = 400,
        SpawnLeaders = 3,
        Generator = "mountainTent",
        LeaderDesc = {
            {LeaderType = Entities.PU_LeaderCavalry2, SoldierNum = 3, SpawnNum = 1, Looped = true, Experience = 2},
            {LeaderType = Entities.PU_LeaderPoleArm4, SoldierNum = 4, SpawnNum = 1, Looped = true, Experience = 2},
            {LeaderType = Entities.PU_LeaderRifle1, SoldierNum = 4, SpawnNum = 2, Looped = true, Experience = 2},
        }
    })
    spawnArmyMountains:AddCommandMove(GetPosition("mountainEntrance"),true)
    spawnArmyMountains:AddCommandWaitForIdle(true)
    spawnArmyMountains:AddCommandMove(GetPosition("westEntrance"),true)
    spawnArmyMountains:AddCommandWaitForIdle(true)
    spawnArmyMountains:AddCommandAttackNearestTarget(5000,true)
end

function upgradesSpawner()
    if (IsDead("tower1") and IsDead("tower2")) then
        SpawnerLeftVillage.ArmySize = SpawnerLeftVillage.ArmySize + 2
        SpawnerLeftVillage.SpawnLeaders = SpawnerLeftVillage.SpawnLeaders + 2
        if getArchipelagoDifficultyMultiplier() >= 5 then
            SpawnerRightVillage.ArmySize = SpawnerRightVillage.ArmySize + 4
            SpawnerRightVillage.SpawnLeaders = SpawnerRightVillage.SpawnLeaders + 4
        end
        if getArchipelagoDifficultyMultiplier() >= 6 then
            SpawnerMountains.ArmySize = SpawnerMountains.ArmySize + 2
            SpawnerMountains.SpawnLeaders = SpawnerMountains.SpawnLeaders + 2
        end
        return true
    end
end