
-- defenders of Morfichet north on player's river side

createArmyFirstLineDefenders = function()

	--	set up

		armyFirstLineDefendersA					= {}
	
		armyFirstLineDefendersA.player 			= 2
		armyFirstLineDefendersA.id				= 2
		armyFirstLineDefendersA.strength		= 5
		armyFirstLineDefendersA.position		= GetPosition("KI1_Position")
		armyFirstLineDefendersA.rodeLength		= 2000
		armyFirstLineDefendersA.control			= {}
		armyFirstLineDefendersA.control.time	= 0
		
		SetupArmy(armyFirstLineDefendersA)

	--	create
			
		local troopDescription = {
		
			minNumberOfSoldiers	= 9,
			maxNumberOfSoldiers	= 9,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry1
	
		EnlargeArmy(armyFirstLineDefendersA,troopDescription)
	
		troopDescription.leaderType = Entities.PU_LeaderBow3
	
		EnlargeArmy(armyFirstLineDefendersA,troopDescription)
		EnlargeArmy(armyFirstLineDefendersA,troopDescription)
	
		troopDescription.leaderType = Entities.PU_LeaderSword3
	
		EnlargeArmy(armyFirstLineDefendersA,troopDescription)
		EnlargeArmy(armyFirstLineDefendersA,troopDescription)

	--	start controlling job
	
		StartJob("ControlArmyFirstLineDefenders")

	end
	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyFirstLineDefenders"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyFirstLineDefenders = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armyFirstLineDefendersA.control.time = armyFirstLineDefendersA.control.time +1
		
		return Counter.Tick2("ControlArmyFirstLineDefenders",2)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyFirstLineDefenders = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyFirstLineDefendersA) then
		
			return true
			
			end

		if armyFirstLineDefendersA.control.time > 30 + Logic.GetRandom(20) then
		
			FrontalAttack(armyFirstLineDefendersA)
			
			if armyFirstLineDefendersA.control.time > 50  + Logic.GetRandom(20) then
			
				Redeploy(armyFirstLineDefendersA,GetPosition("KI1_Position"),2000)
			
				armyFirstLineDefendersA.control.time = 0
				
				end			
		
		else
		
			Defend(armyFirstLineDefendersA)
			
			end

		return false
		
		end
	