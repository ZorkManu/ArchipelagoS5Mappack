
createArmyDefendMines = function()

	--	set up

		armyDefendMines					= {}
	
		armyDefendMines.player 			= 4
		armyDefendMines.id				= 8
		armyDefendMines.strength		= 1
		armyDefendMines.position		= GetPosition("defendMines")
		armyDefendMines.rodeLength		= 1000
		
		SetupArmy(armyDefendMines)

	--	create 
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.PU_LeaderBow2
	
		EnlargeArmy(armyDefendMines,troopDescription)

	end
