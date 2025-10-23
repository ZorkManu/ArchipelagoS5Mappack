createArmySwamp1 = function()

	--	set up

		armySwamp1					= {}
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			armySwamp1[i]			= {}
			armySwamp1[i].player 	= 6
			armySwamp1[i].id		= i
			armySwamp1[i].strength	= 1
			armySwamp1[i].position	= GetPosition("attSpawnPoint1_SA")
			armySwamp1[i].rodeLength = 1000
			
			SetupArmy(armySwamp1[i])

			--	create 
				
			local troopDescription = {
			
				maxNumberOfSoldiers	= 3,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}			

			troopDescription.leaderType = Entities.CU_BanditLeaderSword1
		
			EnlargeArmy(armySwamp1[i], troopDescription)
		end

	end
