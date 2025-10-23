function InitOutpost3()

	gvMission.Outpost3 = {}

	gvMission.Outpost3.Position 	= {}
	gvMission.Outpost3.Army 		= 5
	gvMission.Outpost3.Player		= 5
	gvMission.Outpost3.SupplyPosition	= {}
	gvMission.Outpost3.DefendRange	= 2000
	
	gvMission.CannonAttack3			= 0
	
	gvMission.Outpost3.AttackStart = Logic.GetRandom(120)+ 120
	gvMission.Outpost3.AttackEnd = gvMission.Outpost1.AttackStart + 240 + Logic.GetRandom(300)

	AI.Player_EnableAi(gvMission.Outpost3.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("defRange_OO3"),gvMission.Outpost3.Position)
	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("attSpawnPoint2_OO3"),gvMission.Outpost3.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.Outpost3.Player,
		gvMission.Outpost3.Army,
		gvMission.Outpost3.Position.X, 
		gvMission.Outpost3.Position.Y, 
		gvMission.Outpost3.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.Outpost3.Player,gvMission.Outpost3.Army,4)		
	

	Counter.SetLimit("SetUpArmyOutpost3",6)

	Counter.SetLimit("AttackController_OO3",10000)

	GlobalMissionScripting.RequestTrigger("SetUpArmyOutpost3")
	
	-- trigger for OO3 attacks : bishop captured (moved to bishop quest part)
	-- GlobalMissionScripting.RequestTrigger("AttackController_OO3")

end


-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyOutpost3()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.Outpost3.Player,gvMission.Outpost3.Army) < 5
	and	Counter.Tick("SetUpArmyOutpost3")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyOutpost3()
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
		gvMission.Outpost3.Player, 
		entityType, 
		9, 
		gvMission.Outpost3.SupplyPosition.X, 
		gvMission.Outpost3.SupplyPosition.Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.Outpost3.Army)

	Counter.SetLimit("SetUpArmyOutpost3",30 + Logic.GetRandom(30))

	return false

	end


-------------------------------------------------------------------------------------------------------------------
function Condition_AttackController_OO3()
-------------------------------------------------------------------------------------------------------------------
	-- activated by capturing the bishop
	return true
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_AttackController_OO3()
-------------------------------------------------------------------------------------------------------------------
	Counter.Tick("AttackController_OO3")	
	local currentTick = Counter.GetTick("AttackController_OO3")	
	if currentTick > gvMission.Outpost3.AttackStart and currentTick < gvMission.Outpost3.AttackEnd then
		local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(gvMission.Outpost3.Player,gvMission.Outpost3.Army)
		AI.Army_SetAnchorRodeLength(gvMission.Outpost3.Player,gvMission.Outpost3.Army,distanceToEnemy)		
	elseif currentTick == gvMission.Outpost3.AttackEnd then
		AI.Army_SetAnchor(
			gvMission.Outpost3.Player,
			gvMission.Outpost3.Army,
			gvMission.Outpost3.Position.X, 
			gvMission.Outpost3.Position.Y, 
			gvMission.Outpost3.DefendRange
		)
		Counter.Reset("AttackController_OO3")
		gvMission.Outpost3.AttackStart = Logic.GetRandom(120)+ 120
		gvMission.Outpost3.AttackEnd = gvMission.Outpost3.AttackStart + 240 + Logic.GetRandom(300)
		end
		
	if currentTick == gvMission.Outpost3.AttackStart then

	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_OO3_attack_note"), 20)
	GUI.CreateMinimapPulse(gvMission.Outpost3.Position.X, gvMission.Outpost3.Position.Y, 0)
	Explore.Show("Mastermind_Explore", gvMission.Outpost3.Position, 2000)
	
		if GlobalMissionScripting.IsEntityAlive(gvMission.CannonAttack3) == false then
				gvMission.CannonAttack3 = GlobalMissionScripting.CreateGroup(
				gvMission.Outpost3.Player, 
				Entities.PV_Cannon2, 
				6, 
				gvMission.Outpost3.SupplyPosition.X, 
				gvMission.Outpost3.SupplyPosition.Y, 
				90 
				)
			AI.Entity_ConnectLeader(gvMission.CannonAttack3,gvMission.Outpost3.Army)
		end
	end

	return false
	end
	
-------------------------------------------------------------------------------------------------------------------
function Condition_OO3Destroyed()
-------------------------------------------------------------------------------------------------------------------
		-- Both towers destroyed
		return 		GlobalMissionScripting.IsEntityDestroyed(gvMission.OO3_Tower[1].ID)
				and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO3_Tower[2].ID)
end

-------------------------------------------------------------------------------------------------------------------
function Action_OO3Destroyed()
-------------------------------------------------------------------------------------------------------------------
	-- Stop generating units
	Trigger.UnrequestTrigger(gvMission.TriggerID_SetUpArmyOutpost3)
	Trigger.UnrequestTrigger(gvMission.TriggerID_AttackController_OO3)
		
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_OO1_note"), 10)
	
	-- Remove marker and exploration
	GUI.DestroyMinimapPulse(CreateMinimapPulse(gvMission.Outpost3.Position.X, gvMission.Outpost3.Position.Y))
	Explore.Hide("Mastermind_Explore")
		
	return 1
end
-------------------------------------------------------------------------------------------------------------------
