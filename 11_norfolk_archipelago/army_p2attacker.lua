setupArmyP2Attacker = function()

	ArmyP2Attacker						= {}

	ArmyP2Attacker.player 				= 	2
	ArmyP2Attacker.id					= 	1
	ArmyP2Attacker.strength				= 	math.min(4, 4 + getArchipelagoDifficultyMultiplier())
	ArmyP2Attacker.position				= 	GetPosition("P2Defense2")
	ArmyP2Attacker.rodeLength			= 	4000
	ArmyP2Attacker.beAgressive			=	true
	                                	
	ArmyP2Attacker.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm,
												UpgradeCategories.LeaderSword,
												Entities.PV_Cannon1,
												Entities.PV_Cannon2,
												Entities.PV_Cannon2,
												Entities.PV_Cannon3
											}

	-- Attack parameter
	ArmyP2Attacker.retreatStrength		= 	0

	ArmyP2Attacker.baseDefenseRange		= 	2000
	ArmyP2Attacker.outerDefenseRange	= 	4000
                                      	
	ArmyP2Attacker.Attack				= 	false
	ArmyP2Attacker.AttackPos			=	GetPosition("P2Defense2")
	ArmyP2Attacker.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP2Attacker)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP2Attacker", ArmyP2Attacker)
	
	-- Control army
	StartJob("ControlArmyP2Attacker")
	
	TimeLine.Enter("Start P2 Attack", TimeLine.Seconds + 600 - getArchipelagoDifficultyMultiplier() * 60, "StartArmyP2Attacker")
end

StartArmyP2Attacker = function()

	if P2WinterAttackGathered == nil then
	-- Begin attack
		ArmyP2Attacker.AttackAllowed = true
		Report("P2NormalAttack")
	end
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2Attacker"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2Attacker = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2Attacker",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2Attacker = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP2Attacker)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
