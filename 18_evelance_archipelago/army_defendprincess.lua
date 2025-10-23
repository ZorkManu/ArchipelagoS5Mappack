
setupArmyDefendPrincess = function()

	--	set up

		armyDefendPrincess					= {}
	
		armyDefendPrincess.player 			= 5
		armyDefendPrincess.id				= 9
		armyDefendPrincess.strength			= 5
		armyDefendPrincess.position			= GetPosition("PrincessDefend")
		armyDefendPrincess.rodeLength		= 2000
		
		SetupArmy(armyDefendPrincess)

	--	create 
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace2
		EnlargeArmy(armyDefendPrincess,troopDescription)
		EnlargeArmy(armyDefendPrincess,troopDescription)

		troopDescription.leaderType = Entities.CU_Barbarian_LeaderClub2
		EnlargeArmy(armyDefendPrincess,troopDescription)
		EnlargeArmy(armyDefendPrincess,troopDescription)

		local troopDescription = {
		
			maxNumberOfSoldiers	= 12,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.PU_LeaderBow3
		EnlargeArmy(armyDefendPrincess,troopDescription)


	end
