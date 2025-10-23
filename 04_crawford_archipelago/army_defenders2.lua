-- Army in East

createArmyDefenders2 = function()

	--	set up

		armyDefenders2						= {}
		armyDefenders2.control				= {}
		armyDefenders2.control.timer		= 0
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyDefenders2[i]				= {}
			armyDefenders2[i].player 		= 3
			armyDefenders2[i].id			= i + 5
			armyDefenders2[i].strength		= 3
			armyDefenders2[i].position		= GetPosition("spawn2")
			armyDefenders2[i].rodeLength	= 4000
			
			SetupArmy(armyDefenders2[i])
		
			--	create

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 2,
				experiencePoints 	= LOW_EXPERIENCE,
			}				


			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1				
			EnlargeArmy(armyDefenders2[i], troopDescription)
			EnlargeArmy(armyDefenders2[i], troopDescription)
			
			troopDescription.leaderType = Entities.PU_LeaderBow1
			EnlargeArmy(armyDefenders2[i], troopDescription)
		end
	
	--	job		
		
		StartJob("ControlArmyDefenders2")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefenders2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefenders2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyDefenders2",2)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefenders2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local allDead = true
		for i = 1, getArchipelagoDifficultyMultiplier() do
			if not IsDead(armyDefenders2[i]) then
				allDead = false
				break
			end
		end

		if allDead then
						
			return true
			
			end

		for i = 1, getArchipelagoDifficultyMultiplier() do
			Defend(armyDefenders2[i])
		end

		return false
		
		end
	