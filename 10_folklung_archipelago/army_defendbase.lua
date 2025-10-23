createArmyDefendBase = function()
	ArmyDefendBase =  {}
	ArmyDefendBase.player 			= 	gvMission.PlayerIDBesieger
	ArmyDefendBase.id				= 	5
	ArmyDefendBase.strength			= 	8
	ArmyDefendBase.rodeLength			= 	5000
	                                	
	local leaderLevel = math.min(4, getArchipelagoDifficultyMultiplier()+1)
	local BowEntity = Entities["PU_LeaderBow" .. leaderLevel]
	
	if getArchipelagoDifficultyMultiplier() == 1 then
		BowEntity = Entities.CU_Barbarian_LeaderClub1
	end
	
	local troopCount = math.min(8, 4 + math.max(0, getArchipelagoDifficultyMultiplier()-2))
	
	ArmyDefendBase.spawnTypes 		= 	{	 {Entities.CU_Barbarian_LeaderClub1, 4},
																				{BowEntity, troopCount},
																				{BowEntity, troopCount} }
  ArmyDefendBase.endless = true
    
	-- Attack parameter
	ArmyDefendBase.retreatStrength	= 	1
	ArmyDefendBase.baseDefenseRange	= 	1000
	ArmyDefendBase.outerDefenseRange	= 	5000
	ArmyDefendBase.spawnPos          =   GetPosition("BesiegerASpawn")
  ArmyDefendBase.respawnTime       =   100 - getArchipelagoDifficultyMultiplier() * 10
  ArmyDefendBase.maxSpawnAmount    =   8

	ArmyDefendBase.position			= 	GetPosition("P5TerritoryCenter")
	-- Setup army
	SetupArmy(ArmyDefendBase)
	
	-- Army generator
	SetupAITroopSpawnGenerator("BesiegerASpawn", ArmyDefendBase)
	
	-- Control army
	DefendBaseControl = StartJob("ControlArmyDefendBase")
end

DisableArmyDefendBase = function()
	if ArmyDefendBase ~= nil then
		DestroyAITroopGenerator(ArmyDefendBase)
		EndJob(DefendBaseControl)
		ArmyDefendBase = nil
	end
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Condition_ControlArmyDefendBase"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefendBase = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ArmyDefendBase",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefendBase = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyDefendBase)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
