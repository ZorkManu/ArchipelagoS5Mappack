setupArmyP4Defense = function()

	ArmyP4Defense1		= {}

	for i = 1, getArchipelagoDifficultyMultiplier() or 4, 1 do
		ArmyP4Defense1[i]		= {}
		initArmyP4Defense(ArmyP4Defense1[i], "ArmyP4Defense" .. i, i+3, "P4DefensePos", 6000)
	end

	StartJob("ControlArmyP4Defense")

end

initArmyP4Defense = function(_army, _name, _index, _pos, _defenseRange)

	_army.player 			= 	4
	_army.id				= 	_index
	_army.strength			= 	8
	_army.position			= 	GetPosition(_pos)
	_army.rodeLength		= 	_defenseRange
	
	_army.AllowedTypes 		= 	{ UpgradeCategories.LeaderBarbarian }
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
	Condition_ControlArmyP4Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP4Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP4Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		for i = 1, getArchipelagoDifficultyMultiplier(), 1 do
			TickOffensiveAIController(ArmyP4Defense1[i])
		end
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
