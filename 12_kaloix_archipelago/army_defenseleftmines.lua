setupArmyDefenseLeftMines = function()

	armyDefenseLeftMines		= {}

	armyDefenseLeftMines.player 			= 7
	armyDefenseLeftMines.id					= 1
	armyDefenseLeftMines.strength			= 3
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
	
end