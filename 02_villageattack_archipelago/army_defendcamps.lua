
createArmyDefendCamps = function()

	--	set up

		armyDefendCamp1					= {}
	
		armyDefendCamp1.player 			= 2
		armyDefendCamp1.id				= 7
		armyDefendCamp1.strength		= 2
		armyDefendCamp1.position		= GetPosition("guard1")
		armyDefendCamp1.rodeLength		= 500
		
		SetupArmy(armyDefendCamp1)

	--	create 
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.CU_BanditLeaderSword1 
		for i = 1, getArchipelagoDifficultyMultiplier() do
			EnlargeArmy(armyDefendCamp1,troopDescription)
		end

		troopDescription.leaderType = Entities.CU_BanditLeaderSword1 
		if getArchipelagoDifficultyMultiplier() > 3 then
			troopDescription.leaderType = Entities.PU_LeaderBow4
		end
		for i = 1, getArchipelagoDifficultyMultiplier() do
			EnlargeArmy(armyDefendCamp1,troopDescription)
		end

	end
