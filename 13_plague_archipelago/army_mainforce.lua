
MAIN_FORCE_RESPAWN_TIME = 300

createArmyMainForce = function()

	--	set up

		armyMainForce					= {}
	
		armyMainForce.player 			= 3
		armyMainForce.id				= 7
		armyMainForce.strength			= 8
		armyMainForce.position			= GetPosition("spawny")
		armyMainForce.rodeLength		= 2000
		armyMainForce.control			= {}
		armyMainForce.control.startTime	= 30 * 60
		armyMainForce.control.retreat	= false
		armyMainForce.control.respawn	= MAIN_FORCE_RESPAWN_TIME

		SetupArmy(armyMainForce)
		
	--	troop variants
	
		mainForcePool = {		
			Entities.PU_LeaderPoleArm3,
			Entities.PU_LeaderSword3,
			Entities.PU_LeaderBow3,
			Entities.PU_LeaderBow3,
			Entities.PU_LeaderBow3,
			Entities.PU_LeaderHeavyCavalry1,
			Entities.PV_Cannon3,
			Entities.PV_Cannon2,
		}
		
	--	start controlling job		
		
		StartJob("SetupArmyMainForce")
		StartJob("ControlArmyMainForce")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyMainForce"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyMainForce.control.startTime > 0 then
		
			armyMainForce.control.startTime = armyMainForce.control.startTime -1

			if armyMainForce.control.startTime == 0 then
			
				createArmyCastleDefenders()
				
				end

			return false
			
			end
		
		armyMainForce.control.respawn = armyMainForce.control.respawn -1
		
		return armyMainForce.control.respawn <= 0
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------

		armyMainForce.control.respawn = MAIN_FORCE_RESPAWN_TIME -( getArchipelagoDifficultyMultiplier()*10)

		if HasFullStrength(armyMainForce) == false then

			for i = 1, getArchipelagoDifficultyMultiplier() do

				local troopDescription = {
			
					minNumberOfSoldiers	= 0,
					maxNumberOfSoldiers	= 9,
					leaderType 			= mainForcePool[Logic.GetRandom(table.getn(mainForcePool)) +1],
					experiencePoints 	= HIGH_EXPERIENCE,
				}													
		
				EnlargeArmy(armyMainForce,troopDescription)

			end
		end
			
		return false
		
		end	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyMainForce"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyMainForce",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyMainForce = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsWeak(armyMainForce) then

			if armyMainForce.control.retreat == false then
		
				armyMainForce.control.retreat = true
	
				Retreat(armyMainForce)
				
			else
			
				Defend(armyMainForce)
				
				end
						
		else			

			armyMainForce.control.retreat = false

			Advance(armyMainForce)

			end

		return false
		
		end
	
