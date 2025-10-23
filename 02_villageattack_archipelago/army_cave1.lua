
createArmyCave1 = function()

	--	set up

		armyCave1					= {}
		armyCave1.control			= {}
		armyCave1.control.delay		= 60 * 10 - getArchipelagoDifficultyMultiplier() * 80
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyCave1[i]				= {}
			armyCave1[i].player 		= 3
			armyCave1[i].id				= i
			armyCave1[i].strength			= 4
			armyCave1[i].position			= GetPosition("cave1")
			armyCave1[i].rodeLength		= 0
			SetupArmy(armyCave1[i])
		end
		
		StartJob("ControlArmyCave1")

		Message("Enemies are coming in " .. armyCave1.control.delay .. " seconds.")

		MapLocal_StartCountDown(armyCave1.control.delay+1)

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCave1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCave1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
			if armyCave1.control.delay > 0 then
		
			armyCave1.control.delay = armyCave1.control.delay -1		
		
			Report("cave1 army attack starts in "..armyCave1.control.delay.." seconds!")
		
			return false

		elseif armyCave1.control.delay == 0 then
	
			-- 	Stop Countdown
			MapLocal_StopCountDown(0)
	
			armyCave1.control.delay = -1
		
			local troopDescription = {
			
				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 2,
				experiencePoints 	= LOW_EXPERIENCE,
			}			
	
			
			troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1

			if getArchipelagoDifficultyMultiplier() > 3 then
				troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2
			end
			for i = 1, getArchipelagoDifficultyMultiplier() do
				EnlargeArmy(armyCave1[i],troopDescription)
				EnlargeArmy(armyCave1[i],troopDescription)
				EnlargeArmy(armyCave1[i],troopDescription)
				EnlargeArmy(armyCave1[i],troopDescription)
				
			end
		end
		
		return Counter.Tick2("ControlArmyCave1",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCave1 = function()
	-------------------------------------------------------------------------------------------------------------------
		dead = true;
		for i = 1, getArchipelagoDifficultyMultiplier(), 1 do
			if not IsDead(armyCave1[i]) then
				dead = false;
				Advance(armyCave1[i])
			end
		end
		
		if dead then
			endQuestSupportVillage1()
			
			startQuestErecsArrival()
		
			return true
				
		end

	end
		
















createTestArmy = function()

	--	set up

		armyTest				= {}
	
		armyTest.player 		= 3
		armyTest.id				= 1
		armyTest.strength		= 3	--5
		armyTest.position		= GetPosition("cave1")
		armyTest.rodeLength		= 1000
		armyTest.control		= {}
		armyTest.control.delay	= 60 * 7
		
		SetupArmy(armyTest)
		
		StartJob("ControlArmyTest")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyTest"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyTest = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyTest.control.delay > 0 then
		
			armyTest.control.delay = armyTest.control.delay -1		
		
			Report("Test army attack starts in "..armyTest.control.delay.." seconds!")
		
			return false

		elseif armyTest.control.delay == 0 then
		
			armyTest.control.delay = -1
		
			local troopDescription = {
			
				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 2,
				experiencePoints 	= LOW_EXPERIENCE,
			}			
	
			
			troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1
		
			EnlargeArmy(armyTest,troopDescription)
			EnlargeArmy(armyTest,troopDescription)
			EnlargeArmy(armyTest,troopDescription)
--			EnlargeArmy(armyTest,troopDescription)
--			EnlargeArmy(armyTest,troopDescription)
			
			end
		
		return Counter.Tick2("ControlArmyTest",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyTest = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyTest) then

			return true
				
			end
				
		FrontalAttack(armyTest)

		return false
		
		end
	