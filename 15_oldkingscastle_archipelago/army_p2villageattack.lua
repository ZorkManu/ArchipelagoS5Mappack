setupArmyP2VillageAttack = function()

	ArmyP2VillageAttack						= {}

	ArmyP2VillageAttack.player 				= 	2
	ArmyP2VillageAttack.id					= 	5
	ArmyP2VillageAttack.strength			= 	4
	ArmyP2VillageAttack.position			= 	GetPosition("AI1_ConcentratingArea1")
	ArmyP2VillageAttack.rodeLength			= 	6000
	ArmyP2VillageAttack.beAgressive			=	true
	                                	
	ArmyP2VillageAttack.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm, 
													UpgradeCategories.LeaderSword, 
													UpgradeCategories.LeaderBow 
												}

	-- Attack parameter
	ArmyP2VillageAttack.retreatStrength		= 	1

	ArmyP2VillageAttack.baseDefenseRange	= 	4000
	ArmyP2VillageAttack.outerDefenseRange	= 	6000
                                      	
	ArmyP2VillageAttack.Attack				= 	false
	ArmyP2VillageAttack.AttackPos			=	{}
	ArmyP2VillageAttack.AttackPos[1]		=	GetPosition("AI1_Attack_DownTown1")
	ArmyP2VillageAttack.AttackPos[2]		=	GetPosition("AI1_Attack_DownTown1")
	ArmyP2VillageAttack.AttackPos[3]		=	GetPosition("AI1_Attack_DownTown1")
	ArmyP2VillageAttack.AttackPos[4]		=	GetPosition("AI1_Attack_DownTown2")
	ArmyP2VillageAttack.AttackPos[5]		=	GetPosition("AI1_Attack_DownTown2")
	ArmyP2VillageAttack.AttackPos[6]		=	GetPosition("AI1_Attack_DownTown2")
	ArmyP2VillageAttack.AttackPos[7]		=	GetPosition("AI1_Attack_DownTown5")
	ArmyP2VillageAttack.AttackPos[8]		=	GetPosition("AI1_Attack_DownTown5")
	ArmyP2VillageAttack.AttackPos[9]		=	GetPosition("AI1_Attack_DownTown3")
	ArmyP2VillageAttack.AttackPos[10]		=	GetPosition("AI1_Attack_DownTown4")
	ArmyP2VillageAttack.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP2VillageAttack)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP2VillageAttack", ArmyP2VillageAttack)
	
	-- Control army
	StartJob("ControlArmyP2VillageAttack")
end

StartArmyP2VillageAttack = function()

	-- Begin attack
	ArmyP2VillageAttack.AttackAllowed = true

	TimeLine.Enter("Allow P2VA Cannons", TimeLine.Seconds + 10*60, "AllowArmyP2VillageAttackCannons")
	TimeLine.Enter("Allow P2VA Cavalry", TimeLine.Seconds + 40*60, "AllowArmyP2VillageAttackCavalry")

	TimeLine.Enter("Increase Size P2VA to 5/1", TimeLine.Seconds + 20*60 - getArchipelagoDifficultyMultiplier()*60, "IncreaseArmyP2VillageAttackSize")
	TimeLine.Enter("Increase Size P2VA to 6/2", TimeLine.Seconds + 30*60 - getArchipelagoDifficultyMultiplier()*60, "IncreaseArmyP2VillageAttackSize")
	TimeLine.Enter("Increase Size P2VA to 7/2", TimeLine.Seconds + 40*60 - getArchipelagoDifficultyMultiplier()*60, "IncreaseArmyP2VillageAttackSize")
	TimeLine.Enter("Increase Size P2VA to 8/2", TimeLine.Seconds + 80*60 - getArchipelagoDifficultyMultiplier()*60, "IncreaseArmyP2VillageAttackSize")

	local i
	for i=2,10 do
		TimeLine.Enter("P2 Attack Wave"..i, TimeLine.Seconds + i*10*60, "GiveP2ArmyResources")
	end
end

AllowArmyP2VillageAttackCannons = function()

	table.insert(ArmyP2VillageAttack.AllowedTypes, 	Entities.PV_Cannon2)
	table.insert(ArmyP2VillageAttack.AllowedTypes, 	Entities.PV_Cannon2)

end

AllowArmyP2VillageAttackCavalry = function()

	table.insert(ArmyP2VillageAttack.AllowedTypes, 	UpgradeCategories.LeaderHeavyCavalry)
	table.insert(ArmyP2VillageAttack.AllowedTypes, 	UpgradeCategories.LeaderCavalry)

end

IncreaseArmyP2VillageAttackSize = function()

	ArmyP2VillageAttack.strength 		=	ArmyP2VillageAttack.strength + 1
	ArmyP2VillageAttack.retreatStrength	=	ArmyP2VillageAttack.strength / 3

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2VillageAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2VillageAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2VillageAttack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2VillageAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP2VillageAttack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
