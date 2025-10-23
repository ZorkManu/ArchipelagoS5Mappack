function InitOutpost2()

	gvMission.Outpost2 = {}

	gvMission.Outpost2.Position 	= {}
	gvMission.Outpost2.Army 		= 2
	gvMission.Outpost2.Player		= 5
	gvMission.Outpost2.SupplyPosition	= {}
	gvMission.Outpost2.DefendRange	= 2000
	gvMission.CannonAttack2			= 0
	
	
	gvMission.Outpost2.AttackStart = Logic.GetRandom(180)+ 600
	gvMission.Outpost2.AttackEnd = gvMission.Outpost2.AttackStart + 120 + Logic.GetRandom(120)

	AI.Player_EnableAi(gvMission.Outpost2.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("defRange_OO2"),gvMission.Outpost2.Position)
	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("attSpawnPoint2_OO2"),gvMission.Outpost2.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.Outpost2.Player,
		gvMission.Outpost2.Army,
		gvMission.Outpost2.Position.X, 
		gvMission.Outpost2.Position.Y, 
		gvMission.Outpost2.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.Outpost2.Player,gvMission.Outpost2.Army,4)		
	

	Counter.SetLimit("SetUpArmyOutpost2",6)

	Counter.SetLimit("AttackController_OO2",10000)

	gvMission.TriggerID_SetUpArmyOutpost2 = GlobalMissionScripting.RequestTrigger("SetUpArmyOutpost2")
	-- trigger for OO1 attacks : P1 met Helias
	-- GlobalMissionScripting.RequestTrigger("AttackController_OO2")
	
	-- Get tower IDs
	gvMission.OO2_Tower = {}
	GlobalMissionScripting.GetPositionsAndIDs("OO2_Tower", 2, "", gvMission.OO2_Tower)

	InitMineGuardWest()
	
	gvMission.TriggerID_AttackController_OO2 = GlobalMissionScripting.RequestTrigger("AttackController_OO2")

	InitSouthAttackArmy()

end


-------------------------------------------------------------------------------------------------------------------
function Condition_OO2Destroyed()
-------------------------------------------------------------------------------------------------------------------
		-- Both towers destroyed
		return 		GlobalMissionScripting.IsEntityDestroyed(gvMission.OO2_Tower[1].ID)
				and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO2_Tower[2].ID)
end

-------------------------------------------------------------------------------------------------------------------
function Action_OO2Destroyed()
-------------------------------------------------------------------------------------------------------------------
	-- Stop generating units
	Trigger.UnrequestTrigger(gvMission.TriggerID_SetUpArmyOutpost2)
	Trigger.UnrequestTrigger(gvMission.TriggerID_AttackController_OO2)
	Trigger.UnrequestTrigger(gvMission.TriggerID_SetUpArmyMineGuardWest)
	
	Trigger.UnrequestTrigger(gvMission.TriggerID_SetUpArmySouthAttackArmy)
	Trigger.UnrequestTrigger(gvMission.TriggerID_AttackController_SDB)
	
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_OO1_note"), 10)
	
	-- Remove marker and exploration
	GUI.DestroyMinimapPulse(CreateMinimapPulse(gvMission.Outpost2.Position.X, gvMission.Outpost2.Position.Y))
	Explore.Hide("OO2_Explore")
	
	return 1
end
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyOutpost2()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.Outpost2.Player,gvMission.Outpost2.Army) < 2
	and	Counter.Tick("SetUpArmyOutpost2")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyOutpost2()
-------------------------------------------------------------------------------------------------------------------
	local entityType
	
	local distribution = Logic.GetRandom(100)
	
	if distribution > 60 then
		entityType = Entities.PU_LeaderSword2
	elseif distribution > 40 then
		entityType = Entities.PU_LeaderBow2
	elseif distribution >= 0 then
		entityType = Entities.PU_LeaderPoleArm2
		end
	
	local leaderId = GlobalMissionScripting.CreateGroup(
		gvMission.Outpost2.Player, 
		entityType, 
		9, 
		gvMission.Outpost2.SupplyPosition.X, 
		gvMission.Outpost2.SupplyPosition.Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.Outpost2.Army)

	Counter.SetLimit("SetUpArmyOutpost2",30 + Logic.GetRandom(30))

	return false

	end


-------------------------------------------------------------------------------------------------------------------
function Condition_AttackController_OO2()
-------------------------------------------------------------------------------------------------------------------
	-- activated by meeting Helias
	return gvMission.MeetHelias ~= nil
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_AttackController_OO2()
-------------------------------------------------------------------------------------------------------------------
	Counter.Tick("AttackController_OO2")	
	local currentTick = Counter.GetTick("AttackController_OO2")	
	if currentTick > gvMission.Outpost2.AttackStart and currentTick < gvMission.Outpost2.AttackEnd then
		local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(gvMission.Outpost2.Player,gvMission.Outpost2.Army)
		AI.Army_SetAnchorRodeLength(gvMission.Outpost2.Player,gvMission.Outpost2.Army,distanceToEnemy)		
	elseif currentTick == gvMission.Outpost2.AttackEnd then
		AI.Army_SetAnchor(
			gvMission.Outpost2.Player,
			gvMission.Outpost2.Army,
			gvMission.Outpost2.Position.X, 
			gvMission.Outpost2.Position.Y, 
			gvMission.Outpost2.DefendRange
		)
		Counter.Reset("AttackController_OO2")
		gvMission.Outpost2.AttackStart = Logic.GetRandom(180)+ 400
		gvMission.Outpost2.AttackEnd = gvMission.Outpost2.AttackStart + 240 + Logic.GetRandom(120)
		end
		
	if currentTick == gvMission.Outpost2.AttackStart  then

		GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_OO2_attack_note"), 20)
		if GlobalMissionScripting.IsEntityAlive(gvMission.CannonAttack2) == false then
				gvMission.CannonAttack2 = GlobalMissionScripting.CreateGroup(
				gvMission.Outpost2.Player, 
				Entities.PV_Cannon2, 
				6, 
				gvMission.Outpost2.SupplyPosition.X, 
				gvMission.Outpost2.SupplyPosition.Y, 
				90 
				)
			AI.Entity_ConnectLeader(gvMission.CannonAttack2,gvMission.Outpost2.Army)
		end
	end

	return false
	end



-------------------------------------------------------------------------------------------------------------------
function InitMineGuardWest()
-------------------------------------------------------------------------------------------------------------------

	gvMission.MineGuardWest = {}

	gvMission.MineGuardWest.Position 	= {}
	gvMission.MineGuardWest.Army 		= 4
	gvMission.MineGuardWest.Player		= 5
	gvMission.MineGuardWest.SupplyPosition	= {}
	gvMission.MineGuardWest.DefendRange	= 5000

	AI.Player_EnableAi(gvMission.MineGuardWest.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("patrol1_WP8"),gvMission.MineGuardWest.Position)
	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("attSpawnPoint1_OO1"),gvMission.MineGuardWest.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.MineGuardWest.Player,
		gvMission.MineGuardWest.Army,
		gvMission.MineGuardWest.Position.X, 
		gvMission.MineGuardWest.Position.Y, 
		gvMission.MineGuardWest.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.MineGuardWest.Player,gvMission.MineGuardWest.Army,4)		
	

	Counter.SetLimit("SetUpArmyMineGuardWest",6)

	gvMission.TriggerID_SetUpArmyMineGuardWest = GlobalMissionScripting.RequestTrigger("SetUpArmyMineGuardWest")

end


-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyMineGuardWest()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.MineGuardWest.Player,gvMission.MineGuardWest.Army) < 2
	and	Counter.Tick("SetUpArmyMineGuardWest")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyMineGuardWest()
-------------------------------------------------------------------------------------------------------------------
	local entityType
	
	local distribution = Logic.GetRandom(100)
	
	if distribution > 60 then
		entityType = Entities.PU_LeaderSword3
	elseif distribution > 40 then
		entityType = Entities.PU_LeaderBow3
	elseif distribution > 0 then
		entityType = Entities.PU_LeaderPoleArm3
		end
	
	local leaderId = GlobalMissionScripting.CreateGroup(
		gvMission.MineGuardWest.Player, 
		entityType, 
		6, 
		gvMission.MineGuardWest.SupplyPosition.X, 
		gvMission.MineGuardWest.SupplyPosition.Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.MineGuardWest.Army)

	Counter.SetLimit("SetUpArmyMineGuardWest",30 + Logic.GetRandom(30))

	return false

	end


-------------------------------------------------------------------------------------------------------------------
function InitSouthAttackArmy()
-------------------------------------------------------------------------------------------------------------------

	gvMission.SouthAttackArmy = {}

	gvMission.SouthAttackArmy.Position 	= {}
	gvMission.SouthAttackArmy.Army 		= 6
	gvMission.SouthAttackArmy.Player		= 5
	gvMission.SouthAttackArmy.SupplyPosition	= {}
	gvMission.SouthAttackArmy.DefendRange	= 2000
		
	gvMission.SouthAttackArmy.AttackStart = Logic.GetRandom(180)+ 720
	gvMission.SouthAttackArmy.AttackEnd = gvMission.SouthAttackArmy.AttackStart + 120 + Logic.GetRandom(120)

	AI.Player_EnableAi(gvMission.SouthAttackArmy.Player)

	
	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("defRange_OO2"),gvMission.SouthAttackArmy.Position)
	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("attSpawnPoint2_OO2"),gvMission.SouthAttackArmy.SupplyPosition)
                          
	-- set up anchor      
	                      
	AI.Army_SetAnchor(
		gvMission.SouthAttackArmy.Player,
		gvMission.SouthAttackArmy.Army,
		gvMission.SouthAttackArmy.Position.X, 
		gvMission.SouthAttackArmy.Position.Y, 
		gvMission.SouthAttackArmy.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army,4)		
	


	Counter.SetLimit("SetUpArmySouthAttackArmy",6)

	Counter.SetLimit("AttackController_SDB",10000)

	gvMission.TriggerID_SetUpArmySouthAttackArmy = GlobalMissionScripting.RequestTrigger("SetUpArmySouthAttackArmy")

	gvMission.TriggerID_AttackController_SDB = GlobalMissionScripting.RequestTrigger("AttackController_SDB")

end

-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmySouthAttackArmy()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army) < 1
	and	Counter.Tick("SetUpArmySouthAttackArmy")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmySouthAttackArmy()
-------------------------------------------------------------------------------------------------------------------
	local entityType
	
	local distribution = Logic.GetRandom(100)
	
	if distribution > 60 then
		entityType = Entities.PU_LeaderSword2
	elseif distribution > 40 then
		entityType = Entities.PU_LeaderBow2
	elseif distribution >= 0 then
		entityType = Entities.PU_LeaderPoleArm2
		end
	
	local leaderId = GlobalMissionScripting.CreateGroup(
		gvMission.SouthAttackArmy.Player, 
		entityType, 
		6, 
		gvMission.SouthAttackArmy.SupplyPosition.X, 
		gvMission.SouthAttackArmy.SupplyPosition.Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.SouthAttackArmy.Army)

	Counter.SetLimit("SetUpArmySouthAttackArmy",30 + Logic.GetRandom(30))

	return false

	end


-------------------------------------------------------------------------------------------------------------------
function Condition_AttackController_SDB()
-------------------------------------------------------------------------------------------------------------------
	-- activated by meeting helias
	return gvMission.MeetHelias ~= nil
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_AttackController_SDB()
-------------------------------------------------------------------------------------------------------------------
	Counter.Tick("AttackController_SDB")	
	local currentTick = Counter.GetTick("AttackController_SDB")	
	if currentTick > gvMission.SouthAttackArmy.AttackStart and currentTick < gvMission.SouthAttackArmy.AttackEnd then
		local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army)
		AI.Army_SetAnchorRodeLength(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army,distanceToEnemy)		
	elseif currentTick == gvMission.SouthAttackArmy.AttackEnd then
		AI.Army_SetAnchor(
			gvMission.SouthAttackArmy.Player,
			gvMission.SouthAttackArmy.Army,
			gvMission.SouthAttackArmy.Position.X, 
			gvMission.SouthAttackArmy.Position.Y, 
			gvMission.SouthAttackArmy.DefendRange
		)
		
		AI.Army_ClearWaypoints(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army)
		
		Counter.Reset("AttackController_SDB")
		gvMission.SouthAttackArmy.AttackStart = Logic.GetRandom(180)+ 400
		gvMission.SouthAttackArmy.AttackEnd = gvMission.SouthAttackArmy.AttackStart + 240 + Logic.GetRandom(120)
		end
		
	if currentTick == gvMission.SouthAttackArmy.AttackStart  then
		---
		--- equip army with all waypoints
		---------------------------------
		    local waypoints = {
		        "patrol3_WP3",
		        "patrol3_WP4",
		        "patrol3_WP5",
		        "patrol3_WP6",
		        "patrol3_WP7",
		        "patrol3_WP8",
		        "patrol3_WP9",
		        "patrol3_WP10",
		        "patrol3_WP20",
		        "attSpawnPoint4_SDB"
		    }
		    FeedArmyWithWaypoints(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army,"SouthAttackArmyWaypointCallback",waypoints)
		    
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_SDB_attack_note"), 20)

	end

	return false
	end

-------------------------------------------------------------------------------------------------------
--
--	                FeedArmyWithWaypoints(<playerId>,<army id>,<waypoint callback>,<table with waypoint names>)
--
-------------------------------------------------------------------------------------------------------
	
FeedArmyWithWaypoints = function(_playerId,_armyId,_callback,_waypointFile)
    AI.Army_SetWaypointCallback(_playerId,_armyId,_callback)
    table.foreach(_waypointFile,function(_,_value)AI.Army_AddWaypoint(_playerId,_armyId,Logic.GetEntityIDByName(_value))end)
	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--                      SouthAttackArmy WaypointCallback
--
-----------------------------------------------------------------------------------------------------------------------	

SouthAttackArmyWaypointCallback = function(_waypointId)
      
    if AI.Army_GetWaypointRuns(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army) > 0 then
        AI.Army_ClearWaypoints(gvMission.SouthAttackArmy.Player,gvMission.SouthAttackArmy.Army)
        end
    
    return 1
    
    end