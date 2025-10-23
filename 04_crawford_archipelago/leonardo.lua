function InitLeoQuest()
	-- Get NPC ID
	gvMission.Leonardo = Logic.GetEntityIDByName("leo")
	
	-- Get mining entity ID
	gvMission.SulfurMines = {}
	GlobalMissionScripting.GetPositionsAndIDs("SulfurMine", 2, "", gvMission.SulfurMines)

	-- Start leo quest
	GlobalMissionScripting.RequestTrigger("MeetLeonardo")
	
	--Get Leo Position
	gvMission.LeonardoPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Leonardo, gvMission.LeonardoPos)	

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.LeonardoPos.X, gvMission.LeonardoPos.Y, 0)
	Explore.Show("Leonardo_Explore", gvMission.LeonardoPos, 2000)	
end


------------------------------------------------------------------------------------------------
function Condition_MeetLeonardo()
	-- Is Dario, Erec or Healias near Leonardo
	return 		Logic.CheckEntitiesDistance(gvMission.Dario, gvMission.Leonardo, 1000 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Erec, gvMission.Leonardo, 1000 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Helias, gvMission.Leonardo, 1000 ) == 1
end
function Action_MeetLeonardo()

	-- Remove marker and exploration
	GUI.DestroyMinimapPulse(gvMission.LeonardoPos.X, gvMission.LeonardoPos.Y)
	Explore.Hide("Leonardo_Explore")
	
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_leonardo2_note"), 20)                                          
	Logic.AddQuest(gvMission.PlayerID, 6, 0, "CM01_04_Crawford_Txt/mission_leonardo_name", "CM01_04_Crawford_Txt/mission_leonardo_desc")  
                                      
	-- Create move minimap marker and Exploration
	local i
	for i = 1, table.getn(gvMission.SulfurMines) do
		GUI.CreateMinimapMarker(gvMission.SulfurMines[i].X, gvMission.SulfurMines[i].Y, 1)
		Explore.Show("SulfurMining_Explore"..i, gvMission.SulfurMines[i], 1000)
		Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
								"Condition_SulfurMineBuild",
								"Action_SulfurMineBuild",
								1,
								{i},
								{i})
	end
		
	-- Create tribute
	Logic.AddTribute(gvMission.PlayerID, 3, 0, 0, "CM01_04_Crawford_Txt/tribute3_leonardo", ResourceType.Sulfur, 15000)
	
	-- Wait for paying tribute
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_TRIBUTE_PAID,
				"Condition_LeonardoTributePaid",
				"Action_LeonardoTributePaid",
				1 )
					
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_LeonardoTributePaid()
	-- Is regent tribute
	return Event.GetTributeUniqueID() == 3
end
function Action_LeonardoTributePaid()
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_leonardo_won"), 20)                                          
	Logic.RemoveQuest(gvMission.PlayerID, 6)
	
	-- delete falling rock entities from map ("fallen_rock_01 bis 010")
	local fallenRocks = {}
	GlobalMissionScripting.GetPositionsAndIDs("fallen_rock_0", 10, "", fallenRocks)
	
	local i
	for i = 1, table.getn(fallenRocks) do
		Logic.DestroyEntity(fallenRocks[i].ID)
	end	

	-- Increase regent done quest count
	gvMission.DoneRegentQuestCount = gvMission.DoneRegentQuestCount + 1
	
	checkLocation("crawford_help_leonardo")
	return 1
end

-------------------------------------------------------------------------------------------------------------

function Condition_SulfurMineBuild(_Index)
	return Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_SulfurMine1, gvMission.SulfurMines[_Index].X, gvMission.SulfurMines[_Index].Y, 100, 1)
end
function Action_SulfurMineBuild(_Index)
	-- Info
	--GUI.AddNote(" Sulfur Mining Outpost erected!")
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mining_outpost_information2_note"), 10) 
	-- Remove marker and exploration
	GUI.DestroyMinimapPulse(gvMission.SulfurMines[_Index].X, gvMission.SulfurMines[_Index].Y)
	Explore.Hide("SulfurMining_Explore".._Index)
	return 1
end