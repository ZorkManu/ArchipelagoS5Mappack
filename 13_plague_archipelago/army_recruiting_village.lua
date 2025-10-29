function createRecruitingArmies()
    local diff = getArchipelagoDifficultyMultiplier()
    PlagueVillageDefenderArmy = UnlimitedArmy:New({
        Player = 2,
        Area = 3000,
        Formation = UnlimitedArmy.Formations.Lines,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })

    PlagueRecruiterDefender = UnlimitedArmyRecruiter:New(PlagueVillageDefenderArmy, {
        Buildings = {
            Logic.GetEntityIDByName("barracks"),
            Logic.GetEntityIDByName("archery")
        },
        ArmySize = 4 + diff,
        UCats = {
            {UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true},
            {UCat = UpgradeCategories.LeaderBow, SpawnNum = 2, Looped = true},
            {UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
        },
        ResCheat = true
    })
    PlagueVillageDefenderArmy:AddCommandMove(GetPosition("KI1_Position"),true)
    PlagueVillageDefenderArmy:AddCommandWaitForIdle(true)
    PlagueVillageDefenderArmy:AddCommandDefend(GetPosition("KI1_Position"), 3000, true)

    PlagueVillageAttackerArmy = UnlimitedArmy:New({
        Player = 2,
        Area = 3000,
        Formation = UnlimitedArmy.Formations.Chaotic,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })

    if diff >= 2 then
        PlagueRecruiterAttacker = UnlimitedArmyRecruiter:New(PlagueVillageAttackerArmy, {
            Buildings = {
                Logic.GetEntityIDByName("barracks"),
                Logic.GetEntityIDByName("archery")
            },
            ArmySize = 2 + diff,
            UCats = {
                {UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true},
                {UCat = UpgradeCategories.LeaderBow, SpawnNum = 1, Looped = true},
                {UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
            ResCheat = true
            },
        })
        PlagueVillageAttackerArmy:AddCommandMove(GetPosition("KI1_Position"),true)
        PlagueVillageAttackerArmy:AddCommandWaitForSpawnerFull(true)
        PlagueVillageAttackerArmy:AddCommandSetSpawnerStatus(false, true)
        PlagueVillageAttackerArmy:AddCommandWaitForIdle(true)
        PlagueVillageAttackerArmy:AddCommandMove(GetPosition("armyPatrol"),true)
        PlagueVillageAttackerArmy:AddCommandWaitForIdle(true)
        PlagueVillageAttackerArmy:AddCommandMove(GetPosition("KI1_Position"),true)
        PlagueVillageAttackerArmy:AddCommandWaitForIdle(true)
        PlagueVillageAttackerArmy:AddCommandMove(GetPosition("FindPilgrim"),true)
        PlagueVillageAttackerArmy:AddCommandWaitForIdle(true)
        PlagueVillageAttackerArmy:AddCommandMove(GetPosition("attack2"),true)
        PlagueVillageAttackerArmy:AddCommandWaitForIdle(true)
        PlagueVillageAttackerArmy:AddCommandMove(GetPosition("base_attack"),true)
        PlagueVillageAttackerArmy:AddCommandWaitForIdle(true)
        PlagueVillageAttackerArmy:AddCommandAttackNearestTarget(500000,true)
        PlagueVillageAttackerArmy:AddCommandSetSpawnerStatus(true,true)
    end
end