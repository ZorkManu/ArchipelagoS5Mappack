function InitSDBQuest()
	-- Damage buildings
	do
		-- Create empty table for positions and IDs
		gvMission.DamageBuildings = {}
	
		-- Fill up table with Positions and Ids from entities
		GlobalMissionScripting.GetPositionsAndIDs("burning", 22, "", gvMission.DamageBuildings)

		-- Damage buildings directly and make invulnerability
		DamageBuildings()
	end
	
	-- Init fighters at South district battle
	InitFightAtSouthDistrict()

	-- Creat trigger for South district battle
	gvMission.rangeCheck = Logic.GetEntityIDByName("rangeCheck1_SDB")
	gvMission.rangeCheckPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.rangeCheck, gvMission.rangeCheckPos)
	GlobalMissionScripting.RequestTrigger("P1_InSouthernDistrict")
	
	-- Create move minimap marker
	GUI.CreateMinimapPulse(gvMission.rangeCheckPos.X, gvMission.rangeCheckPos.Y, 0)
	
end


function InitFightAtSouthDistrict()

	-- Create attackers
	gvMission.SDB = {}

	-- Fill up table with Positions and Ids from entities
	GlobalMissionScripting.GetPositionsAndIDs("attSpawnPoint", 7, "_SDB", gvMission.SDB)
	
	-- Create table for leader
	gvMission.SDBAttackers = {}
	
	-- Create groups..GlobalMissionScripting.CreateGroup(_PlayerID, _LeaderType, _SoldierAmount, _X , _Y ,_Orientation )
	gvMission.SDBAttackers[1] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderSword2, 6, gvMission.SDB[1].X, gvMission.SDB[1].Y, 90 )
	gvMission.SDBAttackers[2] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderBow2, 6, gvMission.SDB[2].X, gvMission.SDB[2].Y, 180 )
	gvMission.SDBAttackers[3] = GlobalMissionScripting.CreateGroup(5, Entities.PV_Cannon2, 0, gvMission.SDB[3].X, gvMission.SDB[3].Y, 180 )
	gvMission.SDBAttackers[4] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderPoleArm2, 6, gvMission.SDB[4].X, gvMission.SDB[4].Y, 270 )
	gvMission.SDBAttackers[5] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderBow2, 6, gvMission.SDB[5].X, gvMission.SDB[5].Y, 180 )
	gvMission.SDBAttackers[6] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderSword2, 6, gvMission.SDB[6].X, gvMission.SDB[6].Y, 270 )
	gvMission.SDBAttackers[7] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderPoleArm2, 6, gvMission.SDB[7].X, gvMission.SDB[7].Y, 270 )
	
	-- Get tower ids
	gvMission.defTower = {}
	GlobalMissionScripting.GetPositionsAndIDs("defTower", 2, "_SDB", gvMission.defTower)


	-- Let move them to their attack positions, get attack points
	gvMission.TargetAreaSDB = {}

	-- Fill up table with Positions and Ids from entities
	GlobalMissionScripting.GetPositionsAndIDs("attTargetArea", 7, "_SDB", gvMission.TargetAreaSDB)
	
	-- Move to attack position without attacking anything
	Logic.MoveSettler(gvMission.SDBAttackers[1], gvMission.TargetAreaSDB[1].X, gvMission.TargetAreaSDB[1].Y, -1)
	Logic.GroupAttack(gvMission.SDBAttackers[2], gvMission.defTower[1].ID)
	Logic.GroupAttack(gvMission.SDBAttackers[3], gvMission.defTower[2].ID)
	Logic.MoveSettler(gvMission.SDBAttackers[4], gvMission.TargetAreaSDB[4].X, gvMission.TargetAreaSDB[4].Y, -1)
	Logic.MoveSettler(gvMission.SDBAttackers[5], gvMission.TargetAreaSDB[5].X, gvMission.TargetAreaSDB[5].Y, -1)
	Logic.MoveSettler(gvMission.SDBAttackers[6], gvMission.TargetAreaSDB[6].X, gvMission.TargetAreaSDB[6].Y, -1)
	Logic.MoveSettler(gvMission.SDBAttackers[7], gvMission.TargetAreaSDB[7].X, gvMission.TargetAreaSDB[7].Y, -1)
	
	-- Create defenders
	gvMission.defSDB = {}

	-- Fill up table with Positions and Ids from entities
	GlobalMissionScripting.GetPositionsAndIDs("defSpawnPoint", 6, "_SDB", gvMission.defSDB)
	
	-- Create table for leader
	gvMission.SDBDefenders = {}
	
	-- Create groups..GlobalMissionScripting.CreateGroup(_PlayerID, _LeaderType, _SoldierAmount, _X , _Y ,_Orientation )
	gvMission.SDBDefenders[1] = GlobalMissionScripting.CreateGroup(2, Entities.PU_LeaderPoleArm2, 6, gvMission.defSDB[1].X, gvMission.defSDB[1].Y, 180 )
	gvMission.SDBDefenders[2] = GlobalMissionScripting.CreateGroup(2, Entities.PU_LeaderSword2, 6, gvMission.defSDB[2].X, gvMission.defSDB[2].Y, 180 )
	gvMission.SDBDefenders[3] = GlobalMissionScripting.CreateGroup(2, Entities.PU_LeaderSword2, 6, gvMission.defSDB[3].X, gvMission.defSDB[3].Y, 180 )
	gvMission.SDBDefenders[4] = GlobalMissionScripting.CreateGroup(2, Entities.PU_LeaderBow2, 6, gvMission.defSDB[4].X, gvMission.defSDB[4].Y, 180 )
	gvMission.SDBDefenders[5] = GlobalMissionScripting.CreateGroup(2, Entities.PU_LeaderBow2, 6, gvMission.defSDB[5].X, gvMission.defSDB[5].Y, 180 )
	gvMission.SDBDefenders[6] = GlobalMissionScripting.CreateGroup(2, Entities.PU_LeaderBow2, 6, gvMission.defSDB[6].X, gvMission.defSDB[6].Y, 180 )
	
	-- Invulnerability
	SetInvulnerabilityOfSDBUnits(1)
	
	-- deactivates AI for these units
	for i = 1, table.getn(gvMission.SDBAttackers) do
		AI.Army_EnableLeaderAi(gvMission.SDBAttackers[i], 0)
	end

end

function DamageBuildings()
	-- Damage all buildings randomly
	-- and make all invulnerability
	local i
	for i =1, table.getn(gvMission.DamageBuildings) do
		-- Get random health, random returns 0-9..we want a range of 5 - 14
		local Health = Logic.GetRandom(10) + 5
		-- Set health of building
		GlobalMissionScripting.ChangeHealthOfEntity(gvMission.DamageBuildings[i].ID, Health)
		
		-- Set immortal
		Logic.SetEntityInvulnerabilityFlag(gvMission.DamageBuildings[i].ID, 1)
	end

	-- Set health of HQ and VC
	GlobalMissionScripting.ChangeHealthOfEntity(gvMission.DamageBuildings[16].ID, 60)
	GlobalMissionScripting.ChangeHealthOfEntity(gvMission.DamageBuildings[22].ID, 60)
end

function SetInvulnerabilityOfSDBUnits(_Flag)
	local i
	for i = 1, table.getn(gvMission.defTower) do
		Logic.SetEntityInvulnerabilityFlag(gvMission.defTower[i].ID, _Flag)
	end
	for i = 1, table.getn(gvMission.SDBAttackers) do
		GlobalMissionScripting.ChangeInvulnerabilityOfGroup(gvMission.SDBAttackers[i], _Flag)
	end
	for i = 1, table.getn(gvMission.SDBDefenders) do
		GlobalMissionScripting.ChangeInvulnerabilityOfGroup(gvMission.SDBDefenders[i], _Flag)
	end
end

------------------------------------------------------------------------------------------------
function Condition_P1_InSouthernDistrict()
	return Logic.IsPlayerEntityInArea(gvMission.PlayerID, gvMission.rangeCheckPos.X, gvMission.rangeCheckPos.Y, 6000)
end
function Action_P1_InSouthernDistrict()

	-- Explore fighting area
	Explore.Show("P1_InSouthernDistrict", gvMission.TargetAreaSDB[3], 2000)
	
	-- Share exploration of burning houses
	Logic.SetShareExplorationWithPlayerFlag(gvMission.PlayerID, 4, 1)
	
	-- Disable invulnerability of fighting leaders
	SetInvulnerabilityOfSDBUnits(0)

	-- Show info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission1_fulfilled1_note"), 20)
		
	-- Create trigger, that waits until all enemies in SDB killed
	GlobalMissionScripting.RequestTrigger("WaitUntilSDBCleared")
	GlobalMissionScripting.RequestTrigger("ShowSDBAttackersLeftInfo")
	
	-- Stop attacking houses...player is neutral
	Logic.SetDiplomacyState( 4, 5, Diplomacy.Neutral)
	
	-- Get entry points
	gvMission.SDBEntryPoint = {}
	GlobalMissionScripting.GetPositionsAndIDs("checkP1inSDB_", 3, "", gvMission.SDBEntryPoint)

	-- Trigger table
	gvMission.TriggerID_NearEntryPoint = {}

	-- Create three triggers
	local i
	for i=1,3 do
		gvMission.TriggerID_NearEntryPoint[i] = GlobalMissionScripting.RequestTrigger("NearEntryPoint"..i)
	end	
				
	-- Remove marker
	GUI.DestroyMinimapPulse(gvMission.rangeCheckPos.X, gvMission.rangeCheckPos.Y)

				
	-- Destroy trigger
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_NearEntryPoint1()
	return Logic.IsPlayerEntityInArea(gvMission.PlayerID, gvMission.SDBEntryPoint[1].X, gvMission.SDBEntryPoint[1].Y, 2000)
end
function Action_NearEntryPoint1()
	-- Send attackers to position
	Logic.GroupAttackMove(gvMission.SDBAttackers[1], gvMission.SDBEntryPoint[1].X, gvMission.SDBEntryPoint[1].Y, -1)			
	Logic.GroupAttackMove(gvMission.SDBAttackers[2], gvMission.SDBEntryPoint[1].X, gvMission.SDBEntryPoint[1].Y, -1)
	Logic.GroupAttackMove(gvMission.SDBAttackers[4], gvMission.SDBEntryPoint[1].X, gvMission.SDBEntryPoint[1].Y, -1)

	-- Send all visible swamp units to point and delete others
	SendOrDeleteSwampUnits(gvMission.SDBEntryPoint[1])
	
	-- Stop checking for other points
	Trigger.UnrequestTrigger(gvMission.TriggerID_NearEntryPoint[2])
	Trigger.UnrequestTrigger(gvMission.TriggerID_NearEntryPoint[3])
	
	-- Delete self
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_NearEntryPoint2()
	return Logic.IsPlayerEntityInArea(gvMission.PlayerID, gvMission.SDBEntryPoint[2].X, gvMission.SDBEntryPoint[2].Y, 2000)
end
function Action_NearEntryPoint2()
	-- Send attackers to position
	Logic.GroupAttackMove(gvMission.SDBAttackers[1], gvMission.SDBEntryPoint[2].X, gvMission.SDBEntryPoint[2].Y, -1)			
	Logic.GroupAttackMove(gvMission.SDBAttackers[2], gvMission.SDBEntryPoint[2].X, gvMission.SDBEntryPoint[2].Y, -1)
	Logic.GroupAttackMove(gvMission.SDBAttackers[4], gvMission.SDBEntryPoint[2].X, gvMission.SDBEntryPoint[2].Y, -1)

	-- Send all visible swamp units to point and delete others
	SendOrDeleteSwampUnits(gvMission.SDBEntryPoint[2])
	
	-- Stop checking for other points
	Trigger.UnrequestTrigger(gvMission.TriggerID_NearEntryPoint[1])
	Trigger.UnrequestTrigger(gvMission.TriggerID_NearEntryPoint[3])
	
	-- Delete self
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_NearEntryPoint3()
	return Logic.IsPlayerEntityInArea(gvMission.PlayerID, gvMission.SDBEntryPoint[3].X, gvMission.SDBEntryPoint[3].Y, 2000)
end
function Action_NearEntryPoint3()
	-- Send attackers to position
	Logic.GroupAttackMove(gvMission.SDBAttackers[1], gvMission.SDBEntryPoint[3].X, gvMission.SDBEntryPoint[3].Y, -1)			
	Logic.GroupAttackMove(gvMission.SDBAttackers[2], gvMission.SDBEntryPoint[3].X, gvMission.SDBEntryPoint[3].Y, -1)
	Logic.GroupAttackMove(gvMission.SDBAttackers[4], gvMission.SDBEntryPoint[3].X, gvMission.SDBEntryPoint[3].Y, -1)

	-- Send all visible swamp units to point and delete others
	SendOrDeleteSwampUnits(gvMission.SDBEntryPoint[3])
	
	-- Stop checking for other points
	Trigger.UnrequestTrigger(gvMission.TriggerID_NearEntryPoint[1])
	Trigger.UnrequestTrigger(gvMission.TriggerID_NearEntryPoint[2])
	
	-- Delete self
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_WaitUntilSDBCleared()
	-- Return if all enemy entities are destroyed
	local i
	for i=1, table.getn(gvMission.SDBAttackers) do
		-- Is alive, condition is false
		if GlobalMissionScripting.IsEntityAlive(gvMission.SDBAttackers[i]) then
			return 0
		end
	end
	-- All dead
	return 1
end
function Action_WaitUntilSDBCleared()
	-- Show info with helias
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission1_fulfilled2_note"), 20)
	Logic.RemoveQuest(gvMission.PlayerID, 1)
		
	-- Destroy fighting area exploration
	Explore.Hide("P1_InSouthernDistrict")
			
	-- Load helias quest and init
	Script.Load( Folders.Map.."Helias.lua")
	InitHeliasQuest()	
	
	-- move defenders back on def pos
	local i 
	for i = 1, table.getn(gvMission.SDBDefenders) do
		Logic.MoveSettler(gvMission.SDBDefenders[i], gvMission.defSDB[i].X, gvMission.defSDB[i].Y)
	end
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_ShowSDBAttackersLeftInfo()
	return Counter.Tick2("ShowSDBAttackersLeftInfo", 15)
end
function Action_ShowSDBAttackersLeftInfo()
	-- Count all attackers
	local AttackersLeft = 0
	local i
	for i=1, table.getn(gvMission.SDBAttackers) do
		-- Is alive
		if GlobalMissionScripting.IsEntityAlive(gvMission.SDBAttackers[i]) then
			AttackersLeft = AttackersLeft + 1
		end
	end
	
	-- Show information
	if AttackersLeft ~= 0 then
		GUI.AddNote(AttackersLeft.." Attackers Left")
	else
		-- Is no one left stop information
		
		return true
	end
end
------------------------------------------------------------------------------------------------

