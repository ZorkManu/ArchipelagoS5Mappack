
createArmyDefendMine = function()

	--	set up

		armyDefendMine				= {}
	
		armyDefendMine.player 		= 2
		armyDefendMine.id			= 2
		armyDefendMine.strength		= 1
		armyDefendMine.position		= GetPosition("defendMine")
		armyDefendMine.rodeLength	= 350
		
		SetupArmy(armyDefendMine)

	--	create 
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.CU_BanditLeaderSword1
	
		EnlargeArmy(armyDefendMine,troopDescription)

	end