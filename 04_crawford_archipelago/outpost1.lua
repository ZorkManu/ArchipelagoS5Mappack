function InitOutpost1()

	gvMission.Outpost1 = {}
                     
	gvMission.Outpost1.Position 	= {}
	gvMission.Outpost1.Army 		= 3
	gvMission.Outpost1.Player		= 5
	gvMission.Outpost1.SupplyPosition	= {}
	gvMission.Outpost1.DefendRange	= 2000
	
	gvMission.CannonAttack1			= 0
	
	gvMission.Outpost1.AttackStart = Logic.GetRandom(180)+ 600
	gvMission.Outpost1.AttackEnd = gvMission.Outpost1.AttackStart + 120 + Logic.GetRandom(120)

	AI.Player_EnableAi(gvMission.Outpost1.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("defRange_OO1"),gvMission.Outpost1.Position)
	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("attSpawnPoint2_OO1"),gvMission.Outpost1.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.Outpost1.Player,
		gvMission.Outpost1.Army,
		gvMission.Outpost1.Position.X, 
		gvMission.Outpost1.Position.Y, 
		gvMission.Outpost1.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.Outpost1.Player,gvMission.Outpost1.Army,4)		
	

	Counter.SetLimit("SetUpArmyOutpost1",6)

	Counter.SetLimit("AttackController_OO1",10000)

	gvMission.TriggerID_SetUpArmyOutpost1 = GlobalMissionScripting.RequestTrigger("SetUpArmyOutpost1")
	-- trigger for OO1 attacks : P1 met Helias
	-- GlobalMissionScripting.RequestTrigger("AttackController_OO1")
	
	-- Get tower IDs
	gvMission.OO1_Tower = {}
	GlobalMissionScripting.GetPositionsAndIDs("OO1_Tower", 2, "", gvMission.OO1_Tower)

	InitMineGuardSouth()

	gvMission.TriggerID_AttackController_OO1 = GlobalMissionScripting.RequestTrigger("AttackController_OO1")

end

-------------------------------------------------------------------------------------------------------------------
function Condition_OO1Destroyed()
-------------------------------------------------------------------------------------------------------------------
		-- Both towers destroyed
		return 		GlobalMissionScripting.IsEntityDestroyed(gvMission.OO1_Tower[1].ID)
				and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO1_Tower[2].ID)
end

-------------------------------------------------------------------------------------------------------------------
function Action_OO1Destroyed()
-------------------------------------------------------------------------------------------------------------------
	-- Stop generating units
	Trigger.UnrequestTrigger(gvMission.TriggerID_SetUpArmyOutpost1)
	Trigger.UnrequestTrigger(gvMission.TriggerID_AttackController_OO1)
	Trigger.UnrequestTrigger(gvMission.TriggerID_SetUpArmyMineGuardSouth)
	
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_OO1_note"), 10)
	
	-- Remove marker and exploration
	GUI.DestroyMinimapPulse(CreateMinimapPulse(gvMission.Outpost1.Position.X, gvMission.Outpost1.Position.Y))
	Explore.Hide("OO1_Explore")
	return 1
end
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyOutpost1()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.Outpost1.Player,gvMission.Outpost1.Army) < 2
	and	Counter.Tick("SetUpArmyOutpost1")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyOutpost1()
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
		gvMission.Outpost1.Player, 
		entityType,      
		9,               
		gvMission.Outpost1.SupplyPosition.X, 
		gvMission.Outpost1.SupplyPosition.Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.Outpost1.Army)

	Counter.SetLimit("SetUpArmyOutpost1",30 + Logic.GetRandom(30))

	return false

	end


-------------------------------------------------------------------------------------------------------------------
function Condition_AttackController_OO1()
-------------------------------------------------------------------------------------------------------------------
	-- activated by meeting Helias
	return gvMission.MeetHelias ~= nil
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_AttackController_OO1()
-------------------------------------------------------------------------------------------------------------------
	Counter.Tick("AttackController_OO1")	
	local currentTick = Counter.GetTick("AttackController_OO1")	
	if currentTick > gvMission.Outpost1.AttackStart and currentTick < gvMission.Outpost1.AttackEnd then
		local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(gvMission.Outpost1.Player,gvMission.Outpost1.Army)
		AI.Army_SetAnchorRodeLength(gvMission.Outpost1.Player,gvMission.Outpost1.Army,distanceToEnemy)		
	elseif currentTick == gvMission.Outpost1.AttackEnd then
		AI.Army_SetAnchor(
			gvMission.Outpost1.Player,
			gvMission.Outpost1.Army,
			gvMission.Outpost1.Position.X, 
			gvMission.Outpost1.Position.Y, 
			gvMission.Outpost1.DefendRange
		)
		Counter.Reset("AttackController_OO1")
		gvMission.Outpost1.AttackStart = Logic.GetRandom(180)+ 400
		gvMission.Outpost1.AttackEnd = gvMission.Outpost1.AttackStart + 240 + Logic.GetRandom(120)
		end
		
		if currentTick == gvMission.Outpost1.AttackStart  then

		GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_OO1_attack_note"), 20)
		
		if GlobalMissionScripting.IsEntityAlive(gvMission.CannonAttack1) == false then
				gvMission.CannonAttack1 =  GlobalMissionScripting.CreateGroup(
				gvMission.Outpost1.Player, 
				Entities.PV_Cannon2, 
				6, 
				gvMission.Outpost1.SupplyPosition.X, 
				gvMission.Outpost1.SupplyPosition.Y, 
				90 
				)
				AI.Entity_ConnectLeader(gvMission.CannonAttack1,gvMission.Outpost1.Army)
			end
		end

	return false
	end



-------------------------------------------------------------------------------------------------------------------
function InitMineGuardSouth()

	gvMission.MineGuardSouth = {}

	gvMission.MineGuardSouth.Position 	= {}
	gvMission.MineGuardSouth.Army 		= 1
	gvMission.MineGuardSouth.Player		= 5
	gvMission.MineGuardSouth.SupplyPosition	= {}
	gvMission.MineGuardSouth.DefendRange	= 5000

	AI.Player_EnableAi(gvMission.MineGuardSouth.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("patrol3_WP8"),gvMission.MineGuardSouth.Position)
	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("attSpawnPoint1_OO2"),gvMission.MineGuardSouth.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.MineGuardSouth.Player,
		gvMission.MineGuardSouth.Army,
		gvMission.MineGuardSouth.Position.X, 
		gvMission.MineGuardSouth.Position.Y, 
		gvMission.MineGuardSouth.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.MineGuardSouth.Player,gvMission.MineGuardSouth.Army,4)		
	

	Counter.SetLimit("SetUpArmyMineGuardSouth",6)

	gvMission.TriggerID_SetUpArmyMineGuardSouth = GlobalMissionScripting.RequestTrigger("SetUpArmyMineGuardSouth")

end

-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyMineGuardSouth()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.MineGuardSouth.Player,gvMission.MineGuardSouth.Army) < 2
	and	Counter.Tick("SetUpArmyMineGuardSouth")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyMineGuardSouth()
-------------------------------------------------------------------------------------------------------------------
	local entityType
	
	local distribution = Logic.GetRandom(100)
	
	if distribution > 60 then
		entityType = Entities.PU_LeaderSword3
	elseif distribution > 40 then
		entityType = Entities.PU_LeaderBow3
	elseif distribution >= 0 then
		entityType = Entities.PU_LeaderPoleArm3
		end
	
	local leaderId = GlobalMissionScripting.CreateGroup(
		gvMission.MineGuardSouth.Player, 
		entityType, 
		6, 
		gvMission.MineGuardSouth.SupplyPosition.X, 
		gvMission.MineGuardSouth.SupplyPosition.Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.MineGuardSouth.Army)

	Counter.SetLimit("SetUpArmyMineGuardSouth",30 + Logic.GetRandom(30))

	return false

	end




