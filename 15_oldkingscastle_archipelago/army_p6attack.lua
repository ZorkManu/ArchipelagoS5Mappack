setupArmyP6Attack = function()

	ArmyP6Attack					= {}

	ArmyP6Attack.player 			= 	6
	ArmyP6Attack.id					= 	1
	ArmyP6Attack.strength			= 	6
	ArmyP6Attack.position			= 	GetPosition("P6Defense")
	ArmyP6Attack.rodeLength			= 	6000
	                                	
	ArmyP6Attack.AllowedTypes 		= 	{	UpgradeCategories.LeaderBow, 
											UpgradeCategories.LeaderCavalry, 
											UpgradeCategories.LeaderHeavyCavalry }

	-- Attack parameter
	ArmyP6Attack.retreatStrength	= 	2

	ArmyP6Attack.baseDefenseRange	= 	3000
	ArmyP6Attack.outerDefenseRange	= 	3000
                                      	
	ArmyP6Attack.Attack				= 	false
	ArmyP6Attack.AttackPos			=	GetPosition("P6AttackPos")
	ArmyP6Attack.AttackAllowed		= 	true


	-- Setup army
	SetupArmy(ArmyP6Attack)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP6Attack", ArmyP6Attack)
	
	-- Control army
	StartJob("ControlArmyP6Attack")

end



-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP6Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP6Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP6Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP6Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP6Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
