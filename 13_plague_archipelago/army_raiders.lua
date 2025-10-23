
-- robbers at treasure chests

createArmyRaiders = function()

	--	set up

		armyRaiders							= {}
	
		armyRaiders.player 					= 3
		armyRaiders.id						= 2
		armyRaiders.strength				= 8
		armyRaiders.position				= GetPosition("spawnRaiders")
		armyRaiders.rodeLength				= 200
		
		SetupArmy(armyRaiders)

	--	create 
			
		local troopDescription = {
		
			leaderType 			= Entities.CU_BlackKnight_LeaderMace2,
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers	= 8,
			experiencePoints 	= VERYHIGH_EXPERIENCE,
		}			
	
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		EnlargeArmy(armyRaiders,troopDescription)
		
	--	start controlling job		
		
		StartJob("ControlArmyRaiders")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyRaiders"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyRaiders = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyRaiders = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyRaiders) then
		
			return true
				
			end

		FrontalAttack(armyRaiders)

		return false
		
		end
	
