createArmyCleycourtPatrol = function()

	patrolDelay = 0

	--	set up

		armyCleycourtPatrol				= {}
	
		armyCleycourtPatrol.player 		= 4
		armyCleycourtPatrol.id			= 1
		armyCleycourtPatrol.strength	= 2 + getArchipelagoDifficultyMultiplier()
		armyCleycourtPatrol.position	= GetPosition("waypoint1")
		armyCleycourtPatrol.rodeLength	= 50
		armyCleycourtPatrol.beAgressive	= true
		
		SetupArmy(armyCleycourtPatrol)

	--	create
		
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 9,
			experiencePoints 	= LOW_EXPERIENCE,
		}			


		troopDescription.leaderType = Entities.PU_LeaderBow3
		for i=1,getArchipelagoDifficultyMultiplier()+1 do
			EnlargeArmy(armyCleycourtPatrol,troopDescription)				
		end

	--	waypoints

	    local waypoints = {
	        "waypoint1",
	        "waypoint2",
	        "waypoint3",
	    }
	    
	    FeedArmyWithWaypoints(armyCleycourtPatrol.player,armyCleycourtPatrol.id,"CleycourtPatrolWaypointCallback",waypoints)

		end

CleycourtPatrolWaypointCallback = function(_waypointId)
   
	if patrolDelay < 20 then
	
		patrolDelay = patrolDelay +1
		
		return 0
		
		end
		
	patrolDelay = 0
   
    return 1
    
    end	
	