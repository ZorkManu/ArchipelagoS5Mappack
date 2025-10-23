createArmyAttackPlayerA = function()
	ArmyAttackPlayerA					= {}

	ArmyAttackPlayerA.player 			= 	gvMission.PlayerIDBesieger
	ArmyAttackPlayerA.id				= 	1
	ArmyAttackPlayerA.position			= 	GetPosition("ArmyAttackPlayer")
	ArmyAttackPlayerA.rodeLength			= 	1000

    ArmyAttackPlayerA.strength			= 	7
	if getArchipelagoDifficultyMultiplier() > 2 then
		ArmyAttackPlayerA.strength = 8
	end
	
	local leaderLevel = math.min(4, getArchipelagoDifficultyMultiplier())
	local SwordEntity = Entities["PU_LeaderSword" .. leaderLevel]	
	local BowEntity = Entities["PU_LeaderBow" .. leaderLevel]

	if getArchipelagoDifficultyMultiplier() == 1 then
		SwordEntity = Entities.CU_Barbarian_LeaderClub1
	end
	
	local troopCount = math.min(8, 4 + math.max(0, getArchipelagoDifficultyMultiplier()-2))
	
	ArmyAttackPlayerA.spawnTypes 		= 	{	 {Entities.CU_Barbarian_LeaderClub1, 4}	,
																					{Entities.CU_Barbarian_LeaderClub1, 4},
																					{SwordEntity, troopCount},
																					{SwordEntity, troopCount},
																					{SwordEntity, troopCount},
																					{BowEntity, troopCount},
																					{BowEntity, troopCount},
																					{BowEntity, troopCount}
																					}
    
	ArmyAttackPlayerA.spawnPos          =   GetPosition("ArmyAttackPlayer")
    ArmyAttackPlayerA.respawnTime       =   80 - getArchipelagoDifficultyMultiplier() * 10
	-- Attack parameter
	ArmyAttackPlayerA.retreatStrength	= 	1

	ArmyAttackPlayerA.baseDefenseRange	= 	1000
	ArmyAttackPlayerA.outerDefenseRange	= 	1000
                                      	
	ArmyAttackPlayerA.Attack			= 	true
	ArmyAttackPlayerA.AttackPos			=	GetPosition("ArmyAttackPlayerAttackPoint")

    ArmyAttackPlayerA.refresh           = false
    ArmyAttackPlayerA.AttackAllowed		= true
    
    ArmyAttackPlayerA.endless = true

	-- Setup army
	SetupArmy(ArmyAttackPlayerA)
	
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyAttackPlayerASpawn", ArmyAttackPlayerA)
	
	-- Control army
	PlayerAttackControler = StartJob("ControlArmyAttackPlayerA")
	
	QuestBastilleDestroyed = {}
	QuestBastilleDestroyed.Targets = {"BastillePlayerAttack1"}
																	
	QuestBastilleDestroyed.Callback = ArmyPlayerAttackDestroyed
	SetupDestroy(QuestBastilleDestroyed)
end


ArmyPlayerAttackDestroyed = function()
	if ArmyAttackPlayerA ~= nil then
		DestroyAITroopGenerator(ArmyAttackPlayerA)
		EndJob(PlayerAttackControler)
		ArmyAttackPlayerA = nil
	end
	Report("Bastille2 Destroyed")
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttackPlayerA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyAttackPlayerA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttackPlayerA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAttackPlayerA)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------


DisableArmyPlayerAttack	= function()
	if ArmyAttackPlayerA ~= nil then
		DestroyAITroopGenerator(ArmyAttackPlayerA)
		EndJob(PlayerAttackControler)
		ArmyAttackPlayerA = nil
	end
end