-- Army in west

createArmyDefenders1 = function()

	--	set up

		armyDefenders1						= {}
		armyDefenders1.control				= {}
		armyDefenders1.control.timer		= 0
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyDefenders1[i]				= {}
			armyDefenders1[i].player 		= 3
			armyDefenders1[i].id			= i
			armyDefenders1[i].strength		= 3
			armyDefenders1[i].position		= GetPosition("spawn1")
			armyDefenders1[i].rodeLength	= 4000
			
			SetupArmy(armyDefenders1[i])
		
			--	create

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 2,
				experiencePoints 	= LOW_EXPERIENCE,
			}				


			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1				
			EnlargeArmy(armyDefenders1[i], troopDescription)
			EnlargeArmy(armyDefenders1[i], troopDescription)
			
			troopDescription.leaderType = Entities.PU_LeaderBow1
			EnlargeArmy(armyDefenders1[i], troopDescription)
		end
	
	--	job		
		
		StartJob("ControlArmyDefenders1")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefenders1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefenders1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyDefenders1",2)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefenders1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local allDead = true
		for i = 1, getArchipelagoDifficultyMultiplier() do
			if not IsDead(armyDefenders1[i]) then
				allDead = false
				break
			end
		end

		if allDead then
						
			return true
			
			end

		for i = 1, getArchipelagoDifficultyMultiplier() do
			Defend(armyDefenders1[i])
		end

		return false
		
		end
	