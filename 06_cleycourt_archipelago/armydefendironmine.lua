
function SetupArmyDefendIronMine()

	--	amry set up

		armyDefendIronMine				= {}
		
		armyDefendIronMine.player 		= gvMission_Enemy2ID
		armyDefendIronMine.id			= 1
		armyDefendIronMine.strength		= 4
		armyDefendIronMine.position		= GetPosition("KITroopPositon")
		armyDefendIronMine.rodeLength	= 1000
	
	AI.Army_SetAnchor(armyDefendIronMine.player,armyDefendIronMine.id,armyDefendIronMine.position.X,armyDefendIronMine.position.Y,armyDefendIronMine.rodeLength)
	
	--	create test troops	
		local troopDescription = {			
				leaderType 			= Entities.PU_LeaderSword2,
				soldierType			= Entities.PU_SoldierSword2,
				maxNumberOfSoldiers	= 8,
				minNumberOfSolderis	= 8,
				experiencePoints 	= VERYHIGH_EXPERIENCE,}
	
		CreateTroop(armyDefendIronMine.player,armyDefendIronMine.position,troopDescription)
end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefendIronMine"
--
-----------------------------------------------------------------------------------------------------------------------	
	
function Condition_ControlArmyDefendIronMine()	
	return 	true
end
function Action_ControlArmyDefendIronMine()	
	AI.Entity_ConnectUnemployedLeaderToArmy(armyDefendIronMine.player,armyDefendIronMine.id,3)
	return false	
end
-----------------------------------------------------------------------------------------------------------------------	
