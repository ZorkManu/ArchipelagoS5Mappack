createArmyAttack2 = function()

	--	set up

		armyAttack2						= {}
	
		armyAttack2.player 				= 8
		armyAttack2.id					= 2
		armyAttack2.strength			= 2
		armyAttack2.position			= GetPosition("army2")
		armyAttack2.rodeLength			= 50
		
		SetupArmy(armyAttack2)
		
	--	job		
		
		StartJob("SetupArmyAttack2")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyAttack2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("SetupArmyAttack2",81)				
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsDead("tower1") then
		
			return true
			
			end

		if HasFullStrength(armyAttack2) then
		
			StartJob("ControlArmyAttack2")
			
			return true
			
			end

		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4 + getArchipelagoDifficultyMultiplier()-2,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		local leaderLevel = math.min(4, math.max(1, getArchipelagoDifficultyMultiplier()-1))
		troopDescription.leaderType = Entities["PU_LeaderSword" .. leaderLevel]
		EnlargeArmy(armyAttack2,troopDescription)				

		return false
		
		end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("ControlArmyAttack2",45)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttack2) then
		
			Retreat(armyAttack2)
			
			StartJob("SetupArmyAttack2")
			
			return true

		else
		
			Advance(armyAttack2)
			
			end

		return false
		
		end
	