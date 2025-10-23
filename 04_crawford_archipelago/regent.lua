function InitRegentQuest()

	-- Get regent ID
	gvMission.Regent = Logic.GetEntityIDByName("regent")
	
	--Get regent Position
	gvMission.RegentPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Regent, gvMission.RegentPos)
	
	-- Get mining entity ID
	gvMission.Mining = {}
	GlobalMissionScripting.GetPositionsAndIDs("Mining", 6, "", gvMission.Mining)
	
	-- Get trader IDs
	gvMission.TradingN = Logic.GetEntityIDByName("TradingN")		
	gvMission.TradingE = Logic.GetEntityIDByName("TradingE")		
	
	-- No Quest done
	gvMission.DoneRegentQuestCount = 0
	
	-- Init defenders quest
	Script.Load( Folders.Map.."CrawfordDefenders1.lua")
	InitCrawfordDefenders1Quest()	
	
	-- Create regent trigger
	GlobalMissionScripting.RequestTrigger("MeetRegent")

	-- Init crawford Defender status message trigger
	gvMission.TriggerID_RegentQuestDone1 = GlobalMissionScripting.RequestTrigger("RegentQuestDone1")
	gvMission.TriggerID_RegentQuestDone2 = GlobalMissionScripting.RequestTrigger("RegentQuestDone2")

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.RegentPos.X, gvMission.RegentPos.Y, 0)
	Explore.Show("Regent_Explore", gvMission.RegentPos, 2000)
end

------------------------------------------------------------------------------------------------
function Condition_MeetRegent()
	-- Is Dario, Erec or Healias near Regent
	return 		Logic.CheckEntitiesDistance(getLeadingHero(), gvMission.Regent, 1000 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Erec, gvMission.Regent, 1000 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Helias, gvMission.Regent, 1000 ) == 1
end
function Action_MeetRegent()
	
	-- Remove marker and exploration
	GUI.DestroyMinimapPulse(gvMission.RegentPos.X, gvMission.RegentPos.Y)
	Explore.Hide("Regent_Explore")
	
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_regent_note"), 20)
	Logic.AddQuest(gvMission.PlayerID, 7, 0, "CM01_04_Crawford_Txt/mission_regent_name", "CM01_04_Crawford_Txt/mission_regent_desc")
	
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_tradingcompany_note"), 20)
	Logic.AddQuest(gvMission.PlayerID, 8, 0, "CM01_04_Crawford_Txt/mission_tradingcompany_name", "CM01_04_Crawford_Txt/mission_tradingcompany_desc")

  	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_leonardo_note"), 20)
		
	-- Create move minimap marker and Exploration
	local i
	for i = 1, table.getn(gvMission.Mining) do
		GUI.CreateMinimapMarker(gvMission.Mining[i].X, gvMission.Mining[i].Y, 1)
		Explore.Show("Mining_Explore"..i, gvMission.Mining[i], 1000)
		Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
								"Condition_MineBuild",
								"Action_MineBuild",
								1,
								{i},
								{i})
	end
	
	  	
	-- Load leo quest and init
	Script.Load( Folders.Map.."Leonardo.lua")
	InitLeoQuest()
	
	--Get TradingN Position
	gvMission.TradingNPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.TradingN, gvMission.TradingNPos)	

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.TradingNPos.X, gvMission.TradingNPos.Y, 0)
	Explore.Show("TradingN_Explore", gvMission.TradingNPos, 4000)
	
	--Get TradingE Position
	gvMission.TradingEPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.TradingE, gvMission.TradingEPos)	

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.TradingEPos.X, gvMission.TradingEPos.Y, 0)
	Explore.Show("TradingE_Explore", gvMission.TradingEPos, 4000)

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.Outpost1.Position.X, gvMission.Outpost1.Position.Y, 2)
	Explore.Show("OO1_Explore", gvMission.Outpost1.Position, 3000)

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.Outpost2.Position.X, gvMission.Outpost2.Position.Y, 2)
	Explore.Show("OO2_Explore", gvMission.Outpost2.Position, 3000)

	GlobalMissionScripting.RequestTrigger("TradingCompany")
	
	-- Create tribute
	Logic.AddTribute(gvMission.PlayerID, 2, 0, 0, "CM01_04_Crawford_Txt/tribute2_regent", ResourceType.Iron, 20000)
	
	-- Wait for paying tribute
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_TRIBUTE_PAID,
				"Condition_RegentTributePaid",
				"Action_RegentTributePaid",
				1 )
					
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_RegentTributePaid()
	-- Is regent tribute
	return Event.GetTributeUniqueID() == 2
end
function Action_RegentTributePaid()
	-- Info
 	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_regent_won"), 20)    
 	Logic.RemoveQuest(gvMission.PlayerID, 7)
	-- Increase regent done quest count
	gvMission.DoneRegentQuestCount = gvMission.DoneRegentQuestCount + 1
		
	return 1
end
------------------------------------------------------------------------------------------------

function Condition_TradingCompany()
	-- are all 4 OO towers destroyed
	return 	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO2_Tower[1].ID)
		and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO2_Tower[2].ID)
		and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO1_Tower[1].ID)
		and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO1_Tower[1].ID)
end
function Action_TradingCompany()
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_tradingcompany_won"), 20)    
	-- Increase regent done quest count
	gvMission.DoneRegentQuestCount = gvMission.DoneRegentQuestCount + 1
	
	-- Remove Trading Company Quest
	Logic.RemoveQuest(gvMission.PlayerID, 8)

	return 1
end

------------------------------------------------------------------------------------------------

function Condition_MineBuild(_Index)
	return Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_IronMine1, gvMission.Mining[_Index].X, gvMission.Mining[_Index].Y, 100, 1)
end
function Action_MineBuild(_Index)
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mining_outpost_information1_note"), 10)    
	
	-- Remove marker and exploration
	GUI.DestroyMinimapPulse(gvMission.Mining[_Index].X, gvMission.Mining[_Index].Y)
	Explore.Hide("Mining_Explore".._Index)
	return 1
end

--------------------------------------------------------------------------------
function Condition_RegentQuestDone1()
	return gvMission.DoneRegentQuestCount >= 1
end

function Action_RegentQuestDone1()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_regent_quest1_note"), 20)    
	return 1
end

function Condition_RegentQuestDone2()
	return gvMission.DoneRegentQuestCount >= 2
end

function Action_RegentQuestDone2()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_regent_quest2_note"), 20)
	return 1
end