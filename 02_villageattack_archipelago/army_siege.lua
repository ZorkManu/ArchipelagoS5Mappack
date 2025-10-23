
createArmySiege = function()

	--	set up

		armySiege				= {}
	
		armySiege.player 		= 2
		armySiege.id			= 3
		armySiege.strength		= 2
		armySiege.position		= GetPosition("siege")
		armySiege.rodeLength	= 1000
		
		SetupArmy(armySiege)

	--	create 
		
-->TF: code block moved to Cutscene_Control.lua	

--		local troopDescription = {
--		
--			maxNumberOfSoldiers	= 3,
--			minNumberOfSoldiers	= 0,
--			experiencePoints 	= LOW_EXPERIENCE,
--		}			
--
--		troopDescription.leaderType = Entities.PU_LeaderPoleArm1
--	
--		EnlargeArmy(armySiege,troopDescription)
--
--		troopDescription.leaderType = Entities.PU_LeaderSword1
--	
--		EnlargeArmy(armySiege,troopDescription)
--
--	--	job
--	
--		StartJob("ControlArmySiege")

--<



	end

	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmySiege"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmySiege = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmySiege",3)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmySiege = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsDead(armySiege) then	

			endQuestMoveToCastle()
			
			return true
		
			end
			
		FrontalAttack(armySiege)

		return false
		
		end		
-----------------------------------------------------------------------------------------------------------------------	
