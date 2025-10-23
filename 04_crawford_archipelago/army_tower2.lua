-- attackers from East

ATTACK_DELAY_TOWER2 							= 3 * 60 - getArchipelagoDifficultyMultiplier() * 20

createArmyTower2 = function()

	--	set up

		armyTower2						= {}
		armyTower2.control				= {}
		armyTower2.control.delay		= ATTACK_DELAY_TOWER2

		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyTower2[i]				= {}
			armyTower2[i].player 		= 7
			armyTower2[i].id			= i + 5
			armyTower2[i].strength		= 2
			armyTower2[i].position		= GetPosition("spawn2")
			armyTower2[i].rodeLength	= 2000
			SetupArmy(armyTower2[i])
		end
		
		StartJob("SetupArmyTower2")

	end



	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyTower2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("SetupArmyTower2",10)
		
		end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		--	check spawn condition 
		
			if IsDead("tower2a") and IsDead("tower2b") then
				
				return true
				
			end

		--	set up completed?

			local allFullStrength = true
			for i = 1, getArchipelagoDifficultyMultiplier() do
				if not HasFullStrength(armyTower2[i]) then
					allFullStrength = false
					break
				end
			end

			if allFullStrength then
	
				armyTower2.control.delay = ATTACK_DELAY_TOWER2 + Logic.GetRandom(180)
			
				StartJob("ControlArmyTower2")
				
				return true
				
			end
				
		-- 	enlarge army

			local troopDescription = {
			
				maxNumberOfSoldiers	= 4,
				minNumberOfSoldiers	= 0,
				experiencePoints 	= LOW_EXPERIENCE,
			}				
		
			if Logic.GetRandom(100) > 60 then
			
				troopDescription.leaderType = Entities.PU_LeaderPoleArm1
				
			else
			
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
			
			end
			
			for i = 1, getArchipelagoDifficultyMultiplier() do
				EnlargeArmy(armyTower2[i], troopDescription)
			end
		

		return false
		
	end



-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyTower2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armyTower2.control.delay = armyTower2.control.delay -1
		
		return Counter.Tick2("ControlArmyTower2",2)
		
	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyTower2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local allDead = true
		for i = 1, getArchipelagoDifficultyMultiplier() do
			if not IsDead(armyTower2[i]) then
				allDead = false
				break
			end
		end

		if allDead then
		
			for i = 1, getArchipelagoDifficultyMultiplier() do
				Retreat(armyTower2[i])
			end
		
			StartJob("SetupArmyTower2")
						
			return true
			
		end


		if armyTower2.control.delay <= 0 then

			Report("Army Tower 2 advances!")
			for i = 1, getArchipelagoDifficultyMultiplier() do
				Advance(armyTower2[i])
			end

		end
		

		return false
		
	end
	