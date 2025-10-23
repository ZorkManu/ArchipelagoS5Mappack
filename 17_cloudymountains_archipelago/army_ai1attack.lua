setupArmyAI1Attack = function()

	ArmyAI1Attack						= {}

	ArmyAI1Attack.player 				= 5
	ArmyAI1Attack.id					= 1
	ArmyAI1Attack.strength				= 6
	ArmyAI1Attack.retreatStrength		= 2
	ArmyAI1Attack.position				= GetPosition("AI1_DefensePos")
	ArmyAI1Attack.baseDefenseRange		= 6000
	ArmyAI1Attack.outerDefenseRange		= 7000
	ArmyAI1Attack.rodeLength			= 3000
	ArmyAI1Attack.beAgressive			= true
	ArmyAI1Attack.AllowedTypes 			= {	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow, 
											Entities.PV_Cannon2,
											Entities.PV_Cannon2 }

	ArmyAI1Attack.Attack				= false
	ArmyAI1Attack.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyAI1Attack)
	
	-- Army generator
	SetupAITroopGenerator("AI1Attack", ArmyAI1Attack)
	
	-- Control army
	StartJob("ControlArmyAI1Attack")
end

StartAttackPos1 = function()

	-- Begin attack
	ArmyAI1Attack.AttackAllowed	= true
	ArmyAI1Attack.AttackPos		= GetPosition("AttackPos1")

end

StartAttackPos2 = function()

	-- Begin attack
	ArmyAI1Attack.AttackAllowed	= true
	ArmyAI1Attack.AttackPos		= GetPosition("AttackPos2")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI1Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAI1Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyAI1Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAI1Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAI1Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
