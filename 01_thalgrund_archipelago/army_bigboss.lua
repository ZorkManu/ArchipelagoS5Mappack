
-- Defenders at robbers camp

createArmyBigBoss = function()

	--	big boss a

		armyBigBossA				= {}
	
		armyBigBossA.player 		= 7
		armyBigBossA.id				= 3
		armyBigBossA.strength		= 3
		armyBigBossA.position		= GetPosition("Jail")
		armyBigBossA.rodeLength		= 500
		
		SetupArmy(armyBigBossA)

	--	create army
			
		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		--	create pike men

			troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
			if getArchipelagoDifficultyMultiplier() == 2 then
				troopDescription.leaderType = Entities.PU_LeaderSword2
			elseif getArchipelagoDifficultyMultiplier() >= 3 then
				troopDescription.leaderType = Entities.PU_LeaderSword3
			end
--			troopDescription.leaderType = Entities.PU_LeaderPoleArm1
			for i = 1, getArchipelagoDifficultyMultiplier()*2 do
				EnlargeArmy(armyBigBossA,troopDescription)
			end

		--	create bandit boss

			troopDescription.maxNumberOfSoldiers = 2
			troopDescription.leaderType = Entities.PU_LeaderCavalry1
			
			if getArchipelagoDifficultyMultiplier() > 3 then
				troopDescription.leaderType = Entities.PU_LeaderCavalry2
			end

			for i = 1, getArchipelagoDifficultyMultiplier() do
				EnlargeArmy(armyBigBossA,troopDescription)
			end

	--	start job
	
		StartJob("ControlArmyBigBossA")

end







-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyBigBossA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyBigBossA = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyBigBossA",5)
		
	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyBigBossA = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyBigBossA) then

			return true
			
			end
		
		return false
		
	end
