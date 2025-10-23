
createArmyBanditGroups = function()

if 0==1 then

	--	bandit groups a

		armyBanditGroupsA				= {}
	
		armyBanditGroupsA.player 		= 7
		armyBanditGroupsA.id			= 5
		armyBanditGroupsA.strength		= 1
		armyBanditGroupsA.position		= GetPosition("smallArmyA")
		armyBanditGroupsA.rodeLength	= 1000
		
		SetupArmy(armyBanditGroupsA)

	--	create army
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			


--		troopDescription.leaderType = Entities.CU_BanditLeaderSword1
		troopDescription.leaderType = Entities.PU_LeaderSword1
	
		EnlargeArmy(armyBanditGroupsA,troopDescription)

	--	big boss c

		armyBanditGroupsB			= {}
	
		armyBanditGroupsB.player 		= 7
		armyBanditGroupsB.id			= 6
		armyBanditGroupsB.strength		= 1
		armyBanditGroupsB.position		= GetPosition("smallArmyB")
		armyBanditGroupsB.rodeLength	= 1000
		
		SetupArmy(armyBanditGroupsB)

	--	create army
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 6,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			


--		troopDescription.leaderType = Entities.CU_BanditLeaderSword1
		troopDescription.leaderType = Entities.PU_LeaderSword1
	
		EnlargeArmy(armyBanditGroupsB,troopDescription)

end

	end