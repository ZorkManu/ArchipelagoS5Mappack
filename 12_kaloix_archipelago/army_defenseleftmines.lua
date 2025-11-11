setupArmyDefenseLeftMines = function()

	armyDefenseLeftMines		= {}

	armyDefenseLeftMines.player 			= 7
	armyDefenseLeftMines.id					= 1
	armyDefenseLeftMines.strength			= 3 + math.min(5,getArchipelagoDifficultyMultiplier())
	armyDefenseLeftMines.position			= GetPosition("DefenceLeftMinesPos")
	armyDefenseLeftMines.rodeLength			= 2500
	armyDefenseLeftMines.spawnTypes 		= { { Entities.PU_LeaderPoleArm1, 4},
												{ Entities.PU_LeaderSword1, 4},
												{ Entities.PU_LeaderPoleArm1, 4},
												{ Entities.PU_LeaderPoleArm1, 4},
												{ Entities.PU_LeaderSword1, 4},
												{ Entities.PU_LeaderHeavyCavalry1, 4},
												{ Entities.PU_LeaderHeavyCavalry1, 4},
												{ Entities.PU_LeaderHeavyCavalry2, 4} }
	armyDefenseLeftMines.spawnPos			= GetPosition("DefenceLeftMinesSpawn")
	armyDefenseLeftMines.spawnGenerator		= "DefenceLeftMinesHQ"
	armyDefenseLeftMines.respawnTime		= 60
	armyDefenseLeftMines.endless			= false
	armyDefenseLeftMines.noEnemy 			= true
	armyDefenseLeftMines.noEnemyDistance 	= 2000
	armyDefenseLeftMines.maxSpawnAmount 	= 1
	-- Setup army
	SetupArmy(armyDefenseLeftMines)
	
	-- Army generator
	SetupAITroopSpawnGenerator("DefenseLeftMines_Generator", armyDefenseLeftMines)
	
	if getArchipelagoDifficultyMultiplier() >= 3 then
        StartSimpleJob("waitForSpawnerLeftMines")
    end
end

function waitForSpawnerLeftMines()
	if Counter.Tick2("waitForSpawnerLeftMines",300) then
		if GlobalMissionScripting.IsEntityDestroyed("DefenceLeftMinesHQ") then
			return true
		end
		initSpawnerLeftMines(getArchipelagoDifficultyMultiplier())
		return true
	end
end

function initSpawnerLeftMines(_diff)
    local spawnArmyLeftMines = UnlimitedArmy:New({
        Player = 7,
        Area = 3000,
        Formation = UnlimitedArmy.Formations.Lines,
        LeaderFormation  = FormationFunktion,
        TransitAttackMove = true,
    })
    SpawnerLeftMines = UnlimitedArmySpawnGenerator:New(spawnArmyLeftMines, {
        Position = GetPosition("DefenceLeftMinesSpawn"),
        ArmySize = _diff+4,
        SpawnCounter = 300,
        SpawnLeaders = _diff+4,
		Generator = "DefenceLeftMinesHQ",
        LeaderDesc = {
            {LeaderType = Entities["PU_LeaderSword" .. math.min(4, math.max(1, _diff-3))], SoldierNum = 2+_diff, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PU_LeaderBow" .. math.min(4, math.max(1, _diff-3))], SoldierNum = 2+_diff, SpawnNum = 1, Looped = true, Experience = 0},
            {LeaderType =  Entities["PU_LeaderPoleArm" .. math.min(2, math.max(1, _diff-3))], SoldierNum = 2+_diff, SpawnNum = 1, Looped = true, Experience = 0},
        }
    })

	spawnArmyLeftMines:AddCommandMove(GetPosition("DefenceLeftMinesPos"), true)
	spawnArmyLeftMines:AddCommandWaitForIdle(true)
	spawnArmyLeftMines:AddCommandMove(GetPosition("Harbour1"),true)
	spawnArmyLeftMines:AddCommandWaitForIdle(true)
	spawnArmyLeftMines:AddCommandAttackNearestTarget(10000,true)
end