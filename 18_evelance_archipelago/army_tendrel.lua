-- Position in front of the right village

setupArmyTendrel = function()

	ArmyTendrel							= {}

	ArmyTendrel.player 					= 6
	ArmyTendrel.id						= 1
	ArmyTendrel.strength				= 6
	ArmyTendrel.position				= GetPosition("TendrelOffensePos")
	ArmyTendrel.rodeLength				= 21000
	
	ArmyTendrel.AllowedTypes = { 	UpgradeCategories.LeaderCavalry, 
									UpgradeCategories.LeaderHeavyCavalry }



	ArmyTendrel.retreatStrength			= 0
	ArmyTendrel.baseDefenseRange		= 21000
	ArmyTendrel.outerDefenseRange		= 21000
	ArmyTendrel.Attack					= false
	ArmyTendrel.AttackAllowed			= false

	-- Setup army
	SetupArmy(ArmyTendrel)
	
	-- Army generator
	SetupAITroopGenerator("Tendrel", ArmyTendrel)

	-- Control army
	StartJob("ControlArmyTendrel")

end

StartTendrelDefense = function()

	-- Become hostile to kerberos
	Logic.SetDiplomacyState( 6, 5, Diplomacy.Hostile )
	setupArmyTendrel()
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyTendrel"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyTendrel = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyTendrel",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyTendrel = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyTendrel)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
