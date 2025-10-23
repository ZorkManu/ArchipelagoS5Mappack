--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitKerberosFunctions()
	---------------------------------------------------------------
	--GlobalMissionScripting.RequestTrigger( "KerberosCreatePatrolTroop" )
	
	gvMission = {}
	gvMission.KerberosPatrolTroop = {}
	gvMission.KerberosPatrolTroop[1] = 0
	gvMission.KerberosPatrolTroop[2] = 0
	gvMission.KerberosPatrolTroop[3] = 0
	gvMission_KerberosPatrolTroopCount = 1
	gvMission_KerberosTroopPatrolEnd = Logic.GetEntityIDByName("KerberosPatrolPoint15")
		
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_KerberosCreatePatrolTroop()
	return Counter.Tick2("KerberosCreatePatrolTroop", 300) -- 5 minutes
end
function Action_KerberosCreatePatrolTroop()
	Mission_KerberosPatrolTroop()
	GlobalMissionScripting.RequestTrigger( "KerberosCreatePatrolTroop2" )
	GlobalMissionScripting.RequestTrigger( "KerberosCreatePatrolTroop3" )
	
	GlobalMissionScripting.RequestTrigger( "CheckKerberosTroopPatrolEnd" )	
end
function Condition_KerberosCreatePatrolTroop2()
	return Counter.Tick2("KerberosCreatePatrolTroop2", 3) -- 3 second
end
function Action_KerberosCreatePatrolTroop2()
	Mission_KerberosPatrolTroop()
	return 1
end
function Condition_KerberosCreatePatrolTroop3()
	return Counter.Tick2("KerberosCreatePatrolTroop3", 6) -- 6 second
end
function Action_KerberosCreatePatrolTroop3()
	Mission_KerberosPatrolTroop()
	return 1	
end
----------------------------------------------------------------------------------------------
function Mission_KerberosPatrolTroop()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("KerberosPatrolPoint1"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderSword1" davon "5" Stück, auf die Postion "X Y Blickrichtung"	
	local SpawnBanditID = GlobalMissionScripting.CreateGroup(gvMission_Enemy1ID, Entities.PU_LeaderSword2, 8, x, y, 45 )
	-- Formation ändern
	Logic.LeaderChangeFormationType( SpawnBanditID, 1 )
	--------------------------------------------------------------------------------
	-- Set range where they attack enemies
	--local x, y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("KerberosPatrolPoint1"))
	-- Banditen angreifen lassen
	Logic.GroupPatrol(SpawnBanditID, x, y)
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint2")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint3")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint4")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint5")))	
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint6")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint7")))	
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint9")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint10")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint11")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint12")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint13")))		
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint14")))	
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("KerberosPatrolPoint15")))
	
	gvMission.KerberosPatrolTroop[gvMission_KerberosPatrolTroopCount] = SpawnBanditID
	gvMission_KerberosPatrolTroopCount = gvMission_KerberosPatrolTroopCount + 1
	if gvMission_KerberosPatrolTroopCount > 3 then 
		gvMission_KerberosPatrolTroopCount = 1
	end
end
----------------------------------------------------------------------------------------------
function Condition_CheckKerberosTroopPatrolEnd()
	return Counter.Tick2("CheckKerberosTroopPatrolEnd", 2) -- 2 second
end
function Action_CheckKerberosTroopPatrolEnd()
	for i = 1, 3 do
		if Logic.CheckEntitiesDistance(gvMission_KerberosTroopPatrolEnd, gvMission.KerberosPatrolTroop[i], 400) == 1 then
			Logic.DestroyGroupByLeader(gvMission.KerberosPatrolTroop[i])
		end
	end
	
	-- wenn alle PatrolGruppen die Welt verlassen haben, den Trigger löschen
	if GlobalMissionScripting.IsEntityAlive(gvMission.KerberosPatrolTroop[1]) == false
	and GlobalMissionScripting.IsEntityAlive(gvMission.KerberosPatrolTroop[2]) == false
	and GlobalMissionScripting.IsEntityAlive(gvMission.KerberosPatrolTroop[3]) == false then
		return 1
	end
end




-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetUpArmyHero2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
function Condition_KerberosKIPatrolTroop()
	-------------------------------------------------------------------------------------------------------------------
        return true
		end
		
	-------------------------------------------------------------------------------------------------------------------
function Action_KerberosKIPatrolTroop()
	-------------------------------------------------------------------------------------------------------------------
		local player = global.player.EnemyHero
		local army = global.army.EnemyHero
		
		global.entities.player2Hero = Logic.GetEntityIDByName("Player2Hero")		
		
		---
		--- add hero to army 
		--------------------
		    AI.Entity_ConnectLeader(global.entities.player2Hero,army)
		
		---
		--- equip army with all waypoints
		---------------------------------
		    local waypoints = {
		        "wp_p02_000",
		        "wp_p02_001",
		        "wp_p02_002",
		        "wp_p02_003"
		    }
		    FeedArmyWithWaypoints(player,army,"Hero2WaypointCallback",waypoints)

        ---
        --- default settings
        --------------------
            -- very low scatter tolerance => hero must be close to army, before the next waypoint will be activated!
            AI.Army_SetScatterTolerance(player,army,1)
            
            -- tiny army (only one hero and the body guard!)
            AI.Army_SetSize(player,army,1)
        
		return true
		end

-----------------------------------------------------------------------------------------------------------------------	
--
--                      Hero2WaypointCallback
--
-----------------------------------------------------------------------------------------------------------------------	

Hero2WaypointCallback = function(_waypointId)

    Report("Player2Hero _ Next waypoint = ".._waypointId)
    
    if _waypointId == 3 and AI.Entity_IsValid(global.entities.bodyGuards) then
    	if AI.Entity_GetConnectedArmy(global.entities.bodyGuards) == -1 then
    		AI.Entity_ConnectWithArmy(global.entities.bodyGuards,global.army.EnemyHero)
    		AI.Army_EnableLeaderAi(global.entities.bodyGuards,1)
    		Report("body guard added to army of hero!")
    		end
    	end
    
    -- remove all waypoints after the 2nd run
    
    if AI.Army_GetWaypointRuns(global.player.EnemyHero,global.army.EnemyHero) > 1 then
        Report("clear all waypoints")
        AI.Army_ClearWaypoints(global.player.EnemyHero,global.army.EnemyHero)
        end
    
    return 1
    
    end