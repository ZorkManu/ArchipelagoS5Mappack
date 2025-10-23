Script.Load(Folders.MapTools.."Ai\\Support.lua")

----------------------------------------------------------------------------------------
--
--					setupPlayer6
--
----------------------------------------------------------------------------------------

setupPlayer6 = function()

	--EnableDebugging()

	player6		=	{}
	player6.id	=	gvMission_KerberosPatrolID

	AI.Village_EnableExtracting(player6.id,false)

	local description = {
	
		serfLimit				=	0,
		--------------------------------------------------
		resources = {
			gold				=	0,
			clay				=	0,
			iron				=	0,
			sulfur				=	0,
			stone				=	0,
			wood				=	0
		},
		--------------------------------------------------
		refresh = {
			gold				=	0,
			clay				=	0,
			iron				=	0,
			sulfur				=	0,
			stone				=	0,
			wood				=	0,
			updateTime			=	5
		},
	}
	
	SetupPlayerAi(player6.id,description)

	setupPatrolArmy()
	
	end

----------------------------------------------------------------------------------------
--
--					setupPatrolArmy
--
----------------------------------------------------------------------------------------

setupPatrolArmy = function()

	--	define army

		armyPatrol 				= 	{}
		armyPatrol.player		= 	player6.id
		armyPatrol.id			= 	1
		armyPatrol.position		=	GetPosition("KerberosPatrolPoint1")
		armyPatrol.rodeLength	=	0
	
		SetupArmy(armyPatrol)

	--	additional settings

		AI.Army_SetScatterTolerance(armyPatrol.player,armyPatrol.id,1)
		AI.Army_SetSize(armyPatrol.player,armyPatrol.id,1)

	--	set up patrol army

		local troopDescription = {
		
			leaderType 			= Entities.PU_LeaderSword2,
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 9,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		EnlargeArmy(armyPatrol,troopDescription)
		EnlargeArmy(armyPatrol,troopDescription)
		EnlargeArmy(armyPatrol,troopDescription)
	
	--	set up patrol waypoints
	
		local waypoints = {		
	        "KerberosPatrolPoint1",
	        "KerberosPatrolPoint2",
	        "KerberosPatrolPoint3",
	        "KerberosPatrolPoint4",
	        "KerberosPatrolPoint5",
	        "KerberosPatrolPoint6",
	        "KerberosPatrolPoint7",
	        "KerberosPatrolPoint9",
	        "KerberosPatrolPoint10",
	        "KerberosPatrolPoint11",
	        "KerberosPatrolPoint12",
	        "KerberosPatrolPoint13",
	        "KerberosPatrolPoint14",
	        "KerberosPatrolPoint15"	  
	    }
	    
	    FeedArmyWithWaypoints(armyPatrol.player,armyPatrol.id,"ArmyPatrolCallback",waypoints)
	
	end

ArmyPatrolCallback = function(_waypointId)

	if AI.Army_GetWaypointRuns(armyPatrol.player,armyPatrol.id) == 1 then
		
		Report("end of patrol route reached")
		
		AI.Army_ClearWaypoints(armyPatrol.player,armyPatrol.id)
		
		end		
	
	return 1
	
	end





----------------------------------------------------------------------------------------
--
--					setupAttackArmy
--
----------------------------------------------------------------------------------------

setupAttackArmy = function()

	--	define army

		armyAttack 				= 	{}
		armyAttack.player		= 	player6.id
		armyAttack.id			= 	2
		armyAttack.position		=	GetPosition("AICollectPoint")
		armyAttack.rodeLength	=	100
		armyAttack.strength		=	4
	
		SetupArmy(armyAttack)
	
	--	start jobs
	
		StartJob("SetupArmyAttack")

	
	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetupArmyAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetupArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("SetupArmyAttack",40) 
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetupArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------

		local distribution = Logic.GetRandom(100)
		
		local leaderType
		
		if distribution > 70 then			
			leaderType = Entities.PU_LeaderBow2
		elseif distribution > 50 then			
			leaderType = Entities.PU_LeaderSword2
		elseif distribution > 20 then	
			leaderType = Entities.PU_LeaderPoleArm2
		else		
			leaderType = Entities.PV_Cannon2
		end
			
		local troopDescription = {
		
			leaderType 			= leaderType,
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 9,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		armyAttack.position = GetPosition("AIappearPoint")
	
		EnlargeArmy(armyAttack,troopDescription)

		armyAttack.position = GetPosition("AICollectPoint")

		if HasFullStrength(armyAttack) then
			
			Report("rush enemy!")
			
			StartJob("RushArmyAttack")
			
			return true
			
			end
			
		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "RushArmyAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_RushArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("RushArmyAttack",5) 
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_RushArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------

		Advance(armyAttack)

		if IsVeryWeak(armyAttack) then
			
			Report("retreat!")
			
			Retreat(armyAttack)
			
			StartJob("SetupArmyAttack")
			
			return true
			
			end
			
		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	






----------------------------------------------------------------------------------------
--
--					setupPlayer4
--
----------------------------------------------------------------------------------------

setupPlayer4 = function()

	player4		=	{}
	player4.id	=	gvMission_CleycourtID

	AI.Village_EnableExtracting(player4.id,false)

	local description = {
	
		serfLimit				=	10,
		--------------------------------------------------
		resources = {
			gold				=	1000,
			clay				=	1000,
			iron				=	1000,
			sulfur				=	1000,
			stone				=	1000,
			wood				=	1000
		},
		--------------------------------------------------
		refresh = {
			gold				=	0,
			clay				=	0,
			iron				=	0,
			sulfur				=	0,
			stone				=	0,
			wood				=	0,
			updateTime			=	5
		},
	}
	
	SetupPlayerAi(player4.id,description)

	setupDefendArmy()

	end

----------------------------------------------------------------------------------------
--
--					setupDefendArmy
--
----------------------------------------------------------------------------------------

setupDefendArmy = function()

	--	define army

		armyDefend 				= 	{}
		armyDefend.player		= 	player4.id
		armyDefend.id			= 	1
		armyDefend.position		=	GetPosition("CleyBarracks")
		armyDefend.rodeLength	=	5400
	
		SetupArmy(armyDefend)

	--	set up defend army

		local troopDescription = {
		
			leaderType 			= Entities.PU_LeaderSword2,
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 9,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		EnlargeArmy(armyDefend,troopDescription)
		EnlargeArmy(armyDefend,troopDescription)
		
		troopDescription.leaderType = Entities.PU_LeaderBow2,
		
		EnlargeArmy(armyDefend,troopDescription)

		troopDescription.leaderType = Entities.PU_LeaderPoleArm2,
		
		EnlargeArmy(armyDefend,troopDescription)

		troopDescription.leaderType = Entities.PV_Cannon2,
		
		EnlargeArmy(armyDefend,troopDescription)
		EnlargeArmy(armyDefend,troopDescription)
		EnlargeArmy(armyDefend,troopDescription)
	
	end
