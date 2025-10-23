
createArmyDefendIron = function()

	--	set up

		armyDefendIron				= {}
	
		armyDefendIron.player 		= 2
		armyDefendIron.id			= 6
		armyDefendIron.strength		= 1
		armyDefendIron.position		= GetPosition("defendIron")
		armyDefendIron.rodeLength	= 400
		
		SetupArmy(armyDefendIron)

	--	create 
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.CU_BanditLeaderSword1
	
		EnlargeArmy(armyDefendIron,troopDescription)

	end