createArmyCave2 = function()

	--	set up

		armyCave2					= {}
		armyCave2.control			= {}
		armyCave2.control.delay		= 60 * 5 - getArchipelagoDifficultyMultiplier() * 40
	
		for i = 1, getArchipelagoDifficultyMultiplier() do
			armyCave2[i]				= {}
			armyCave2[i].player 		= 3
			armyCave2[i].id				= i
			armyCave2[i].strength		= 8
			armyCave2[i].position		= GetPosition("cave2")
			armyCave2[i].rodeLength		= 0
			SetupArmy(armyCave2[i])
		end
		
		MapLocal_StartCountDown(armyCave2.control.delay+1)

		Message("Enemies are coming in " .. armyCave2.control.delay .. " seconds.")

		StartJob("ControlArmyCave2")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCave2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCave2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyCave2.control.delay > 0 then
		
			armyCave2.control.delay = armyCave2.control.delay -1		
		
			Report("Cave2 army attack starts in "..armyCave2.control.delay.." seconds!")
		
			return false

		elseif armyCave2.control.delay == 0 then
		
			armyCave2.control.delay = -1
		
			local troopDescription = {
			
				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 4,
				experiencePoints 	= LOW_EXPERIENCE,
			}			
	
			for i = 1, getArchipelagoDifficultyMultiplier() do
				troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1 

				if getArchipelagoDifficultyMultiplier() > 5 then
					troopDescription.leaderType = Entities.PU_LeaderSword4
					troopDescription.maxNumberOfSoldiers = 8
				end

				EnlargeArmy(armyCave2[i],troopDescription)
				EnlargeArmy(armyCave2[i],troopDescription)
				EnlargeArmy(armyCave2[i],troopDescription)
				EnlargeArmy(armyCave2[i],troopDescription)

				troopDescription.leaderType = Entities.CU_BanditLeaderSword1
				if getArchipelagoDifficultyMultiplier() > 3 then
					troopDescription.leaderType = Entities.PU_LeaderSword3
					troopDescription.maxNumberOfSoldiers = 8
				end
				EnlargeArmy(armyCave2[i],troopDescription)
				EnlargeArmy(armyCave2[i],troopDescription)
				EnlargeArmy(armyCave2[i],troopDescription)
				EnlargeArmy(armyCave2[i],troopDescription)
			end
	
			-- 	Stop Countdown
			MapLocal_StopCountDown(0)
			
		end
		
		return Counter.Tick2("ControlArmyCave2",5)
		
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCave2 = function()
	-------------------------------------------------------------------------------------------------------------------
		dead = true
		for i = 1, getArchipelagoDifficultyMultiplier() do
			if not IsDead(armyCave2[i]) then
				dead = false
				FrontalAttack(armyCave2[i])
			end
		end
		
		if dead then
			endQuestErecsArrival()	
			return true
		end

		return false
	end
