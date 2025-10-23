createArmyEnemyCastle = function()

	--	dynamic one
	--	-----------

	--	set up

		armyEnemyCastle						= {}
		armyEnemyCastle.control				= {}
		armyEnemyCastle.control.behaviour	= 0				
		armyEnemyCastle.control.advancing	= 0
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyEnemyCastle[i]				= {}
			armyEnemyCastle[i].player 		= 5
			armyEnemyCastle[i].id			= i
			armyEnemyCastle[i].strength		= 8
			armyEnemyCastle[i].position		= GetPosition("enemyCastle")
			armyEnemyCastle[i].rodeLength	= 3500
			
			SetupArmy(armyEnemyCastle[i])

			--	create

			local troopDescription = {
			
				maxNumberOfSoldiers	= 9,
				minNumberOfSoldiers	= 2,
				experiencePoints 	= MEDIUM_EXPERIENCE,
			}				

			troopDescription.leaderType = Entities.PV_Cannon1				
			EnlargeArmy(armyEnemyCastle[i], troopDescription)
			EnlargeArmy(armyEnemyCastle[i], troopDescription)

			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1				
			EnlargeArmy(armyEnemyCastle[i], troopDescription)
			EnlargeArmy(armyEnemyCastle[i], troopDescription)
			EnlargeArmy(armyEnemyCastle[i], troopDescription)
			
			troopDescription.leaderType = Entities.PU_LeaderBow1
			EnlargeArmy(armyEnemyCastle[i], troopDescription)
			EnlargeArmy(armyEnemyCastle[i], troopDescription)
			EnlargeArmy(armyEnemyCastle[i], troopDescription)			
		end

	--	job		
		
		StartJob("ControlArmyEnemyCastle")

	--	static one
	--	----------

	--	set up

		armyDefendEnemyCastle				= {}
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyDefendEnemyCastle[i]		= {}
			armyDefendEnemyCastle[i].player = 5
			armyDefendEnemyCastle[i].id		= i
			armyDefendEnemyCastle[i].strength = 3
			armyDefendEnemyCastle[i].position = GetPosition("enemyCastle")
			armyDefendEnemyCastle[i].rodeLength = 3000
			
			SetupArmy(armyDefendEnemyCastle[i])

			--	create

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 2,
				experiencePoints 	= MEDIUM_EXPERIENCE,
			}				


			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1				
			EnlargeArmy(armyDefendEnemyCastle[i], troopDescription)

			if getArchipelagoDifficultyMultiplier() > 3 then
				troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
			end
			EnlargeArmy(armyDefendEnemyCastle[i], troopDescription)			
			EnlargeArmy(armyDefendEnemyCastle[i], troopDescription)
		end

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyEnemyCastle"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyEnemyCastle = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyEnemyCastle = function()
	-------------------------------------------------------------------------------------------------------------------

		if Logic.GetRandom(100) > 95 then
		
			if armyEnemyCastle.control.behaviour == 0 then
		
				armyEnemyCastle.control.behaviour = 1
				
				armyEnemyCastle.control.advancing = 0
						
				end
				
			end

		if armyEnemyCastle.control.behaviour == 1 then
		
			armyEnemyCastle.control.advancing = armyEnemyCastle.control.advancing +1
			
			if armyEnemyCastle.control.advancing == 130 then
			
				armyEnemyCastle.control.behaviour = 0
				
				for i = 1, getArchipelagoDifficultyMultiplier() do
					Retreat(armyEnemyCastle[i])
				end

				return false
				
				end
			
			for i = 1, getArchipelagoDifficultyMultiplier() do
				Advance(armyEnemyCastle[i])
			end
									
			end

		return false
		
		end
	