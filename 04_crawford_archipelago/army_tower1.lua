-- attackers from west

ATTACK_DELAY_TOWER1 							= 5 * 60 - getArchipelagoDifficultyMultiplier() * 20

createArmyTower1 = function()

	--	set up

		armyTower1						= {}
		armyTower1.control				= {}
		armyTower1.control.delay		= ATTACK_DELAY_TOWER1

		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyTower1[i]				= {}
			armyTower1[i].player 		= 7
			armyTower1[i].id			= i
			armyTower1[i].strength		= 2
			armyTower1[i].position		= GetPosition("spawn1")
			armyTower1[i].rodeLength	= 2000
			SetupArmy(armyTower1[i])
		end
		
		StartJob("SetupArmyTower1")

	end



	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyTower1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("SetupArmyTower1", 10)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		--	check spawn condition 
		
			if IsDead("tower1a") and IsDead("tower1b") then
				
				return true
				
			end


		--	set up completed?

			local allFullStrength = true
			for i = 1, getArchipelagoDifficultyMultiplier() do
				if not HasFullStrength(armyTower1[i]) then
					allFullStrength = false
					break
				end
			end

			if allFullStrength then
	
				armyTower1.control.delay = ATTACK_DELAY_TOWER1 + Logic.GetRandom(120)
			
				StartJob("ControlArmyTower1")
				
				return true
				
			end
				
		-- 	enlarge army

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}				
		
			if Logic.GetRandom(100) > 40 then
			
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
				
			else
			
				troopDescription.leaderType = Entities.PU_LeaderBow1
			
			end
			
			for i = 1, getArchipelagoDifficultyMultiplier() do
				EnlargeArmy(armyTower1[i], troopDescription)
			end
	
		return false
		
	end






-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyTower1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		armyTower1.control.delay = armyTower1.control.delay -1
		
		return Counter.Tick2("ControlArmyTower1",5)
		
	end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyTower1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local allDead = true
		for i = 1, getArchipelagoDifficultyMultiplier() do
			if not IsDead(armyTower1[i]) then
				allDead = false
				break
			end
		end

		if allDead then
		
			for i = 1, getArchipelagoDifficultyMultiplier() do
				Retreat(armyTower1[i])
			end
		
			StartJob("SetupArmyTower1")
						
			return true
			
		end


		if armyTower1.control.delay <= 0 then

			Report("Army Tower 1 advances!")
			for i = 1, getArchipelagoDifficultyMultiplier() do
				Advance(armyTower1[i])
			end

		end	
		

		return false
		
	end
	