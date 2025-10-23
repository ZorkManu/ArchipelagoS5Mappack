function InitHeliasQuest()
	
	-- Get Helias ID
	gvMission.Helias = Logic.GetEntityIDByName("helias")
	
	-- Get Helias Position
	gvMission.HeliasPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Helias, gvMission.HeliasPos)

	-- Create first Helias trigger
	gvMission.TriggerID_MoveToHelias = GlobalMissionScripting.RequestTrigger("MoveToHelias")	

	-- Create move minimap marker & Explore Helias Area
	GUI.CreateMinimapPulse(gvMission.HeliasPos.X, gvMission.HeliasPos.Y, 0)	
	Explore.Show("Helias_Explore", gvMission.HeliasPos, 2000)
end

------------------------------------------------------------------------------------------------
function Condition_MoveToHelias()
	-- Is Dario or Erec near Healias
	return 		Logic.CheckEntitiesDistance(gvMission.Dario, gvMission.Helias, 1000 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Erec, gvMission.Helias, 1000 ) == 1
end
function Action_MoveToHelias()

	-- Tell Player story and give mission2
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/heliasinformation1_note"), 30)
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission2_note"), 20)
	Logic.AddQuest(gvMission.PlayerID, 2, 0, "CM01_04_Crawford_Txt/mission2_name", "CM01_04_Crawford_Txt/mission2_desc")
		
	-- Remove marker	
	GUI.DestroyMinimapPulse(gvMission.HeliasPos.X, gvMission.HeliasPos.Y)
	Explore.Hide("Helias_Explore")	
	
	-- Change player ID of HQ
	gvMission.DamageBuildings[16].ID = Logic.ChangeEntityPlayerID(gvMission.DamageBuildings[16].ID,gvMission.PlayerID)
	gvMission.DamageBuildings[22].ID = Logic.ChangeEntityPlayerID(gvMission.DamageBuildings[22].ID,gvMission.PlayerID)
	
	-- deactivate mission (start)-lost 	
	Trigger.UnrequestTrigger(gvMission.TriggerID_MapLostBeforeMainQuest)
	
	-- Check every 10 seconds if mission is lost
	gvMission.TriggerID_MapLost = GlobalMissionScripting.RequestTrigger("MapLost")
	
	-- Give Start Resources to Player
	GlobalMissionScripting.GiveResouces(gvMission.PlayerID, 450, 1800, 1800, 1800, 900)
		
	gvMission.TriggerID_LetBuildingsDie = GlobalMissionScripting.RequestTrigger("LetBuildingsDie")
	
	-- Change diplomacy state of damaged buildings
	Logic.SetDiplomacyState(1,4, Diplomacy.Hostile)
	
	--Counting down the remaining buildings that need to get destroyed
	GlobalMissionScripting.RequestTrigger("DisplayLeftBuildingsCount")
				
	-- Disable immortal state of buildings
	local i
	for i =1, table.getn(gvMission.DamageBuildings) do
		-- Disable immortal
		Logic.SetEntityInvulnerabilityFlag(gvMission.DamageBuildings[i].ID, 0)
	end			
	
	-- Init tower quest
	Script.Load( Folders.Map.."Tower.lua")
	InitTowerQuest()

	-- Start Attacks from Outposts 1 & 2 
	gvMission.MeetHelias = true

			
	return 1
end

------------------------------------------------------------------------------------------------
function Condition_HeliasNearHQ()
	return Logic.CheckEntitiesDistance(gvMission.Helias, gvMission.rangeCheck, 1000)
end
function Action_HeliasNearHQ()
	
	-- Give helias to player
	gvMission.Helias = Logic.ChangeEntityPlayerID(gvMission.Helias, gvMission.PlayerID)
			
	-- Info, start cutscene
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/heliasinformation2_note"), 30)
	Logic.AddQuest(gvMission.PlayerID, 3, 0, "CM01_04_Crawford_Txt/heliasinformation2_name", "CM01_04_Crawford_Txt/heliasinformation2_desc")

	Script.Load( Folders.Map.."Regent.lua")
	InitRegentQuest()
	
	Script.Load( Folders.Map.."Bishop.lua")
	InitBishopQuest()
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_DisplayLeftBuildingsCount()
	return Counter.Tick2("DisplayLeftBuildingsCount", 15)
end
function Action_DisplayLeftBuildingsCount()
	-- Count left buildings...start with -1 because hq should not be destroyed
	local BuildingsLeft = -2
	local i
	for i=1, table.getn(gvMission.DamageBuildings) do
		-- Is building alive, increase count
		if GlobalMissionScripting.IsEntityAlive(gvMission.DamageBuildings[i].ID) then
			BuildingsLeft = BuildingsLeft + 1
		end
	end
	
	-- Destroy counter if not building left
	if BuildingsLeft == 0 then
		-- Remove trigger for let buildings die
		Trigger.UnrequestTrigger(gvMission.TriggerID_LetBuildingsDie)
		return 1
	else
		-- Else Show count
		GUI.AddNote(BuildingsLeft.." Buildings left")
		return 0
	end
end
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function Condition_LetBuildingsDie()
	return 1
end
function Action_LetBuildingsDie()
	
	local i
	for i =1, table.getn(gvMission.DamageBuildings) do
		if i ~= 16 
		and i ~= 22 then
			if GlobalMissionScripting.IsEntityAlive(gvMission.DamageBuildings[i].ID) then
				Logic.HurtEntity(gvMission.DamageBuildings[i].ID, 3)
			end
		end
	end
	
	return 0
end
