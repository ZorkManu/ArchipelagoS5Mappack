
createArmyBandits = function()

	--	set up

		armyBandits1				= {}
	
		armyBandits1.player 		= 8
		armyBandits1.id				= 5
		armyBandits1.strength		= 3 + getArchipelagoDifficultyMultiplier()
		armyBandits1.position		= GetPosition("bandits")
		armyBandits1.rodeLength		= 3000
		
		SetupArmy(armyBandits1)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4 + getArchipelagoDifficultyMultiplier()-1,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		local leaderLevel = math.min(4, math.max(1, getArchipelagoDifficultyMultiplier()-1))
		troopDescription.leaderType = Entities["PU_LeaderBow" .. leaderLevel]
		for i=1,getArchipelagoDifficultyMultiplier() or 4 do
			EnlargeArmy(armyBandits1,troopDescription)				
		end

		troopDescription.leaderType = Entities["PU_LeaderSword" .. leaderLevel]
		for i=1,getArchipelagoDifficultyMultiplier() or 4 do
			EnlargeArmy(armyBandits1,troopDescription)				
		end

	end
	
	