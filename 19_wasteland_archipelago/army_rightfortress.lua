setupArmyRightFortress = function()

	ArmyRightFortress				= {}

	ArmyRightFortress.player 		= 5
	ArmyRightFortress.id			= 2
	ArmyRightFortress.strength		= 4
	ArmyRightFortress.position		= GetPosition("KI3_DefensePos")
	ArmyRightFortress.rodeLength	= 5000
	
	-- Spawn parameter
	ArmyRightFortress.spawnTypes 		= { { Entities.PU_LeaderPoleArm1, 6},
											{ Entities.PU_LeaderSword1, 3},
											{ Entities.PU_LeaderPoleArm1, 6},
											{ Entities.PU_LeaderPoleArm1, 6},
											{ Entities.PU_LeaderSword1, 3} }
	ArmyRightFortress.spawnPos			= GetPosition("KI3_SpawnPos")
	ArmyRightFortress.spawnGenerator	= "KI3_HQ"
	ArmyRightFortress.respawnTime		= 60
	ArmyRightFortress.endless			= true

	-- Setup army
	SetupArmy(ArmyRightFortress)
	
	-- Army generator
	SetupAITroopSpawnGenerator("RightFortress_Generator", ArmyRightFortress)
	
end