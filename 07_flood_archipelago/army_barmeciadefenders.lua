createArmyBarmeciaDefenders = function()

	--	set up

		armyBarmeciaDefenders1				= {}
	
		armyBarmeciaDefenders1.player 		= 3
		armyBarmeciaDefenders1.id			= 1
		armyBarmeciaDefenders1.strength		= 10
		armyBarmeciaDefenders1.position		= GetPosition("defenders1")
		armyBarmeciaDefenders1.rodeLength	= 4000
		
		SetupArmy(armyBarmeciaDefenders1)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= MEDIUM_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.PU_LeaderPoleArm1
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				

		troopDescription.leaderType = Entities.PU_LeaderBow1
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				

		troopDescription.leaderType = Entities.PU_LeaderSword1
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders1,troopDescription)				

	--	set up

		armyBarmeciaDefenders2				= {}
	
		armyBarmeciaDefenders2.player 		= 3
		armyBarmeciaDefenders2.id			= 2
		armyBarmeciaDefenders2.strength		= 8
		armyBarmeciaDefenders2.position		= GetPosition("defenders2")
		armyBarmeciaDefenders2.rodeLength	= 2000
		
		SetupArmy(armyBarmeciaDefenders2)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 1,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= MEDIUM_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.PU_LeaderSword1
		EnlargeArmy(armyBarmeciaDefenders2,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders2,troopDescription)				

		troopDescription.leaderType = Entities.PU_LeaderBow1
		EnlargeArmy(armyBarmeciaDefenders2,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders2,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders2,troopDescription)				
		EnlargeArmy(armyBarmeciaDefenders2,troopDescription)				

	end
	
	