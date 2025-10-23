createArmySwamp2 = function()

	--	set up

		ArmySwamp2					= {}
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			ArmySwamp2[i]			= {}
			ArmySwamp2[i].player 	= 6
			ArmySwamp2[i].id		= i + 5
			ArmySwamp2[i].strength	= 1
			ArmySwamp2[i].position	= GetPosition("attSpawnPoint2_SA")
			ArmySwamp2[i].rodeLength = 2200
			
			SetupArmy(ArmySwamp2[i])

			--	create 
				
			local troopDescription = {
			
				maxNumberOfSoldiers	= 3,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}			

			troopDescription.leaderType = Entities.CU_BanditLeaderSword1
		
			EnlargeArmy(ArmySwamp2[i], troopDescription)
		end

	end
