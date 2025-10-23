function InitTowerQuest()
		
	-- Tower Trigger table
	gvMission.TriggerID_BuildTowers = {}
	
	-- Create trigger for Build towers
	gvMission.TriggerID_BuildTowers[1] = GlobalMissionScripting.RequestTrigger("BuildTowersW")	
	gvMission.TriggerID_BuildTowers[2] = GlobalMissionScripting.RequestTrigger("BuildTowersN")	
	gvMission.TriggerID_BuildTowers[3] = GlobalMissionScripting.RequestTrigger("BuildTowersE")	
	gvMission.TriggerID_BuildTowers[4] = GlobalMissionScripting.RequestTrigger("BuildTowersS")	

	-- Check tower
	gvMission.TriggerID_CheckTowers = {}

	
	-- Create info counter and trigger
	GlobalMissionScripting.RequestTrigger("DisplayTowersWLeft")		
	GlobalMissionScripting.RequestTrigger("DisplayTowersNLeft")		
	GlobalMissionScripting.RequestTrigger("DisplayTowersELeft")		
	GlobalMissionScripting.RequestTrigger("DisplayTowersSLeft")		

	-- Create main trigger
	GlobalMissionScripting.RequestTrigger("AllTowersBuild")		

	
	-- Get Ids and positions of tower places
	gvMission.TowerSpotW = {}
	gvMission.TowerSpotN = {}
	gvMission.TowerSpotE = {}
	gvMission.TowerSpotS = {}
	GlobalMissionScripting.GetPositionsAndIDs("towerSpot_W", 3, "", gvMission.TowerSpotW)		
	GlobalMissionScripting.GetPositionsAndIDs("towerSpot_N", 3, "", gvMission.TowerSpotN)		
	GlobalMissionScripting.GetPositionsAndIDs("towerSpot_E", 2, "", gvMission.TowerSpotE)		
	GlobalMissionScripting.GetPositionsAndIDs("towerSpot_S", 2, "", gvMission.TowerSpotS)		
				
	-- Explore areas where tower should be build
	ExploreAreas("TowerW", gvMission.TowerSpotW)
	ExploreAreas("TowerN", gvMission.TowerSpotN)
	ExploreAreas("TowerE", gvMission.TowerSpotE)
	ExploreAreas("TowerS", gvMission.TowerSpotS)

end

function ExploreAreas(_Name, _Table)
	-- Get number of table entries
	local Number = table.getn(_Table)
	local i
	for i =1, Number do
		Explore.Show(_Name..i, _Table[i], 500)
	end
end


------------------------------------------------------------------------------------------------
function Condition_BuildTowersW()
	-- Any there
	local i
	for i=1, table.getn(gvMission.TowerSpotW) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotW[i].X, gvMission.TowerSpotW[i].Y, 400, 1) == 0 then
			return 0
		end
	end
	checkLocation("crawford_west_ballista")
	return 1
end
function Action_BuildTowersW()
	-- Towers build
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_towers1_note"), 10)
	
	-- Create check
	gvMission.TriggerID_CheckTowers[1] = GlobalMissionScripting.RequestTrigger("CheckTowersWest")
	
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/heliasinformation4_note"), 20)
	
	return 1
end
------------------------------------------------------------------------------------------------
function UpdateMarkerAndGetLeftTowers(_TowerTable)
	-- Count left buildings
	local BuildingsLeftToBuild = table.getn(_TowerTable)
	local i
	for i=1, table.getn(_TowerTable) do
		-- Is building build, increase count
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, _TowerTable[i].X, _TowerTable[i].Y, 400, 1) == 1 then
			BuildingsLeftToBuild = BuildingsLeftToBuild - 1
		else
			-- Show minimap marker
			GUI.ScriptSignal(_TowerTable[i].X, _TowerTable[i].Y, 1)
		end
	end
	
	-- Return left buildings
	return BuildingsLeftToBuild
end
------------------------------------------------------------------------------------------------
function Condition_DisplayTowersWLeft()
	return Counter.Tick2("DisplayTowersWLeft", 1)
end
function Action_DisplayTowersWLeft()
	-- Count left buildings
	local BuildingsLeftToBuild = UpdateMarkerAndGetLeftTowers(gvMission.TowerSpotW)
	
	-- All build 
	if BuildingsLeftToBuild == 0 then
		return 1
	else
		-- Else Show count
		GUI.AddNote(BuildingsLeftToBuild.." Ballista Towers left to build in West-District")
		-- Set timer back to max time
		Counter.SetLimit("DisplayTowersWLeft",15)
		return 0
	end
end
------------------------------------------------------------------------------------------------
function Condition_BuildTowersN()
	-- Any there
	local i
	for i=1, table.getn(gvMission.TowerSpotN) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotN[i].X, gvMission.TowerSpotN[i].Y, 400, 1) == 0 then
			return 0
		end
	end
	checkLocation("crawford_north_ballista")
	return 1
end
function Action_BuildTowersN()
	-- Towers build
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_towers2_note"), 10)
	
		-- Create check
	gvMission.TriggerID_CheckTowers[2] = GlobalMissionScripting.RequestTrigger("CheckTowersNorth")
	
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_DisplayTowersNLeft()
	return Counter.Tick2("DisplayTowersNLeft", 4)
end
function Action_DisplayTowersNLeft()
	-- Count left buildings
	local BuildingsLeftToBuild = UpdateMarkerAndGetLeftTowers(gvMission.TowerSpotN)

	-- All build 
	if BuildingsLeftToBuild == 0 then
		return 1
	else
		-- Else Show count
		GUI.AddNote(BuildingsLeftToBuild.." Ballista Towers left to build in North-District")
		-- Set timer back to max time
		Counter.SetLimit("DisplayTowersNLeft",15)
		return 0
	end
end
------------------------------------------------------------------------------------------------
function Condition_BuildTowersE()
	-- Any there
	local i
	for i=1, table.getn(gvMission.TowerSpotE) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotE[i].X, gvMission.TowerSpotE[i].Y, 400, 1) == 0 then
			return 0
		end
	end
	checkLocation("crawford_east_ballista")
	return 1
end
function Action_BuildTowersE()
	-- Towers build
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_towers3_note"), 10)
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/heliasinformation5_note"), 20)

	-- Create check
	gvMission.TriggerID_CheckTowers[3] = GlobalMissionScripting.RequestTrigger("CheckTowersEast")
	
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_DisplayTowersELeft()
	return Counter.Tick2("DisplayTowersELeft", 8)
end
function Action_DisplayTowersELeft()
	-- Count left buildings
	local BuildingsLeftToBuild = UpdateMarkerAndGetLeftTowers(gvMission.TowerSpotE)
	
	-- All build 
	if BuildingsLeftToBuild == 0 then
		return 1
	else
		-- Else Show count
		GUI.AddNote(BuildingsLeftToBuild.." Ballista Towers left to build in East-District")
		-- Set timer back to max time
		Counter.SetLimit("DisplayTowersELeft",15)
		return 0
	end
end
------------------------------------------------------------------------------------------------
function Condition_BuildTowersS()
	-- Any there
	local i
	for i=1, table.getn(gvMission.TowerSpotS) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotS[i].X, gvMission.TowerSpotS[i].Y, 400, 1) == 0 then
			return 0
		end
	end
	return 1
end
function Action_BuildTowersS()
	-- Towers build
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_towers4_note"), 10)
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/heliasinformation3_note"), 20)
	
	-- Create check
	gvMission.TriggerID_CheckTowers[4] = GlobalMissionScripting.RequestTrigger("CheckTowersSouth")
	
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_DisplayTowersSLeft()
	return Counter.Tick2("DisplayTowersSLeft", 12)
end
function Action_DisplayTowersSLeft()
	-- Count left buildings
	local BuildingsLeftToBuild = UpdateMarkerAndGetLeftTowers(gvMission.TowerSpotS)
	
	-- All build 
	if BuildingsLeftToBuild == 0 then
		return 1
	else
		-- Else Show count
		GUI.AddNote(BuildingsLeftToBuild.." Ballista Towers left to build in South-District")
		
		-- Set timer back to max time
		Counter.SetLimit("DisplayTowersSLeft",15)
		return 0
	end
end
------------------------------------------------------------------------------------------------
function Condition_AllTowersBuild()
	-- All tower trigger disabled
	local i
	for i=1, table.getn(gvMission.TriggerID_BuildTowers) do
		-- Any trigger alive, not fulfilled
		if Trigger.IsTriggerEnabled(gvMission.TriggerID_BuildTowers[i]) == 1 then
			return 0
		end
	end
	-- no trigger left
	return 1
end
function Action_AllTowersBuild()
	-- Quest done
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission2_won"), 20)
	
	-- Remove Quest mission2
	Logic.RemoveQuest(gvMission.PlayerID, 2)
	
	-- Send Helias to the new HQ 
	Logic.MoveSettler(gvMission.Helias, gvMission.rangeCheckPos.X, gvMission.rangeCheckPos.Y)
	
	-- give infos about the building of the defence towers > Fortification Quest after he is near HQ
	GlobalMissionScripting.RequestTrigger("HeliasNearHQ")

	-- Destroy all check trigger
	local i
	for i=1,4 do
		Trigger.UnrequestTrigger(gvMission.TriggerID_CheckTowers[i])
	end

	return 1
end
------------------------------------------------------------------------------------------------
function Condition_CheckTowersEast()
	-- 
	local i
	for i=1, table.getn(gvMission.TowerSpotE) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotE[i].X, gvMission.TowerSpotE[i].Y, 400, 1) == 0 then
			return 1
		end
	end
end

function Action_CheckTowersEast()
	-- give text : maintain eastern defense towers
	
	-- recreate build check
	gvMission.TriggerID_BuildTowers[3] = GlobalMissionScripting.RequestTrigger("BuildTowersE")	
	GlobalMissionScripting.RequestTrigger("DisplayTowersELeft")		
	
	return 1	
end

------------------------------------------------------------------------------------------------
function Condition_CheckTowersNorth()
	-- 
	local i
	for i=1, table.getn(gvMission.TowerSpotN) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotN[i].X, gvMission.TowerSpotN[i].Y, 400, 1) == 0 then
			return 1
		end
	end
end

function Action_CheckTowersNorth()
	-- give text : maintain North defense towers
	
	-- recreate build check
	gvMission.TriggerID_BuildTowers[2] = GlobalMissionScripting.RequestTrigger("BuildTowersN")	
	GlobalMissionScripting.RequestTrigger("DisplayTowersNLeft")		
	
	return 1	
end

------------------------------------------------------------------------------------------------
function Condition_CheckTowersWest()
	-- 
	local i
	for i=1, table.getn(gvMission.TowerSpotW) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotW[i].X, gvMission.TowerSpotW[i].Y, 400, 1) == 0 then
			return 1
		end
	end
end

function Action_CheckTowersWest()
	-- give text : maintain West defense towers
	
	-- recreate build check
	gvMission.TriggerID_BuildTowers[1] = GlobalMissionScripting.RequestTrigger("BuildTowersW")	
	GlobalMissionScripting.RequestTrigger("DisplayTowersWLeft")		
	
	return 1	
end

------------------------------------------------------------------------------------------------
function Condition_CheckTowersSouth()
	-- 
	local i
	for i=1, table.getn(gvMission.TowerSpotS) do
		if Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Tower2, gvMission.TowerSpotS[i].X, gvMission.TowerSpotS[i].Y, 400, 1) == 0 then
			return 1
		end
	end
end

function Action_CheckTowersSouth()
	-- give text : maintain South defense towers
	
	-- recreate build check
	gvMission.TriggerID_BuildTowers[4] = GlobalMissionScripting.RequestTrigger("BuildTowersS")	
	GlobalMissionScripting.RequestTrigger("DisplayTowersSLeft")		
	
	return 1	
end