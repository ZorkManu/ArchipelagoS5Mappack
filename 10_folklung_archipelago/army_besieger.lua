createArmyBesiegerA = function()
	ArmyBesiegerA					= {}

	ArmyBesiegerA.player 			= 	gvMission.PlayerIDBesieger
	ArmyBesiegerA.id				= 	2
	ArmyBesiegerA.position			= 	GetPosition("BattlepointA")
	ArmyBesiegerA.rodeLength			= 	1000

    ArmyBesiegerA.strength			= 	 5
	local leaderLevel = math.min(4, getArchipelagoDifficultyMultiplier())
	local ClubEntity = Entities.CU_Barbarian_LeaderClub1
	local SwordEntity = Entities["PU_LeaderSword" .. leaderLevel]
	
	if getArchipelagoDifficultyMultiplier() == 1 then
		SwordEntity = Entities.CU_Barbarian_LeaderClub1
	end
	
	ArmyBesiegerA.spawnTypes 		= 	{	 {ClubEntity, 4}, 
												{SwordEntity, 4}, 
												{SwordEntity, 4}
												 }
    ArmyBesiegerA.endless = true
    
	ArmyBesiegerA.spawnPos          =   GetPosition("BesiegerASpawn")
    ArmyBesiegerA.respawnTime       =   40 - getArchipelagoDifficultyMultiplier() * 10
    --ArmyBesiegerA.maxSpawnAmount    =   3

	-- Attack parameter
	ArmyBesiegerA.retreatStrength	= 	1

	ArmyBesiegerA.baseDefenseRange	= 	1000
	ArmyBesiegerA.outerDefenseRange	= 	1000
                                      	
	ArmyBesiegerA.Attack			= 	false
	ArmyBesiegerA.AttackPos			=	GetPosition("AttackPointA")
	
	
	if Logic.GetWeatherState() == 1 then
	    SetSummerBesiegerA()
	    Report("Start WinterBesiegerJob")
	    ArmyWeatherJob = StartJob("WinterBesieger")
	else
	    SetWinterBesiegerA()
	    Report("Start SummerBesiegerJob")
	    ArmyWeatherJob = StartJob("SummerBesieger")
	end
	

	-- Setup army
	SetupArmy(ArmyBesiegerA)
	
	-- Army generator
	SetupAITroopSpawnGenerator("ArmyBesiegerASpawn", ArmyBesiegerA)
	
	-- Control army
	BesiegerControler = StartJob("ControlArmyBesiegerA")
	
	
	QuestBastilleDestroyed = {}
	QuestBastilleDestroyed.Targets = {"Pl5_SpawnPos"}
																	
	QuestBastilleDestroyed.Callback = ArmyBesiegerDestroyed
	SetupDestroy(QuestBastilleDestroyed)
end


ArmyBesiegerASetDefensive = function()
	if ArmyWeatherJob ~= 0 then
		EndJob(ArmyWeatherJob)
		ArmyWeatherJob = 0
	end
	if ArmyBesiegerA ~= nil then
		ArmyBesiegerA.refresh         = true
		ArmyBesiegerA.AttackAllowed		= 	false
		ArmyBesiegerA.respawnTime       =   10
    ArmyBesiegerA.maxSpawnAmount    =   3
		ArmyBesiegerA.retreatStrength	= 	1
		ArmyBesiegerA.baseDefenseRange	= 	4000
		ArmyBesiegerA.outerDefenseRange	= 	7000
		ArmyBesiegerA.rodeLength 				= 7000
		ArmyBesiegerA.strength					= 12
		ArmyBesiegerA.position			= 	GetPosition("P5TerritoryCenter")
		SetupArmy(ArmyBesiegerA)
		Retreat(ArmyBesiegerA)
	end
end

ArmyBesiegerDestroyed = function()
	DestroyAITroopGenerator(ArmyBesiegerA)
	DisableArmyDefendBase()
	
	Report("Bastille Destroyed")
	return 1
end

SetWinterBesiegerA = function()
      ArmyBesiegerA.refresh           = false
	    ArmyBesiegerA.AttackAllowed		= true
end

SetSummerBesiegerA = function()
      ArmyBesiegerA.refresh           = true
	    ArmyBesiegerA.AttackAllowed		= 	false
end


Condition_SummerBesieger = function()
	return Logic.GetWeatherState() == 1
end

Action_SummerBesieger = function()
    SetSummerBesiegerA()
    
		Report("Start WinterBesiegerJob")
    ArmyWeatherJob = StartJob("WinterBesieger")
	return 1
end


Condition_WinterBesieger = function()
	return Logic.GetWeatherState() == 3
end

Action_WinterBesieger = function()
    SetWinterBesiegerA()
    Report("Start SummerBesiegerJob")
    ArmyWeatherJob = StartJob("SummerBesieger")
	return 1
end



-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyBesiegerA = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyBesiegerA",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyBesiegerA = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyBesiegerA)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------



DisableArmyBesiegerA = function()
	if ArmyAttackPlayerA ~= nil then
		DestroyAITroopGenerator(ArmyBesiegerA)
		EndJob(BesiegerControler)
		ArmyBesiegerA = nil
	end
	if ArmyWeatherJob ~= 0 then
		EndJob(ArmyWeatherJob)
		ArmyWeatherJob = 0
	end
end
	
	

	
