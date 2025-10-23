setupArmyP2Defense = function()

	ArmyP2Defense1		= {}
	ArmyP2Defense2		= {}

	for i = 2, getArchipelagoDifficultyMultiplier() or 4, 2 do
		ArmyP2Defense1[i]		= {}
		ArmyP2Defense2[i]		= {}
		initArmyP2Defense(ArmyP2Defense1[i], "ArmyP2Defense" .. i, i, "P2Defense1", 5000)
		initArmyP2Defense(ArmyP2Defense2[i], "ArmyP2Defense" .. i+1, i+1, "P2Defense2", 4000)
	end

	StartJob("ControlArmyP2Defense")

end

initArmyP2Defense = function(_army, _name, _index, _pos, _defenseRange)

	_army.player 			= 	2
	_army.id				= 	_index
	_army.strength			= 	math.min(6, 6 + getArchipelagoDifficultyMultiplier())
	_army.position			= 	GetPosition(_pos)
	_army.rodeLength		= 	_defenseRange
	
	_army.AllowedTypes 		= 	{ 	UpgradeCategories.LeaderPoleArm, 
									UpgradeCategories.LeaderSword,
									UpgradeCategories.LeaderHeavyCavalry,
									Entities.PV_Cannon1,
									Entities.PV_Cannon2,
									Entities.PV_Cannon2,
									Entities.PV_Cannon3
								}
	_army.ignoreAttack		=	true

	-- Attack parameter
	_army.retreatStrength	= 	0

	_army.baseDefenseRange	= 	_defenseRange - 2000
	_army.outerDefenseRange	= 	_defenseRange
                                      	
	_army.Attack			= 	false
	_army.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(_army)
	
	-- Army generator
	SetupAITroopGenerator(_name, _army)
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyLeftFortress"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		for i = 2, getArchipelagoDifficultyMultiplier(), 2 do
			TickOffensiveAIController(ArmyP2Defense1[i])
			TickOffensiveAIController(ArmyP2Defense2[i])
		end
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
