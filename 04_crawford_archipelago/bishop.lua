function InitBishopQuest()

	-- Get Bishop
	gvMission.Bishop = Logic.GetEntityIDByName("bishop")
	
	--Get Bishop Position
	gvMission.BishopPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Bishop, gvMission.BishopPos)	

	--Get Baracks ID
	gvMission.Baracks = Logic.GetEntityIDByName("defSpawnPoint2_CD")
	
	-- Get Baracks Pos
	gvMission.BaracksPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Baracks, gvMission.BaracksPos)
	
	-- Get blocking north exit ID
	gvMission.block = Logic.GetEntityIDByName("block_northExit")
	
	--Get TownExit ID
	gvMission.TownExit = Logic.GetEntityIDByName("TownExit")
	
	-- Get TownExit Pos
	gvMission.TownExitPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.TownExit, gvMission.TownExitPos)
		
	--create table for guardians
	gvMission.Guardian = {}
		
	-- Fill up table with Positions and Ids from entities
	GlobalMissionScripting.GetPositionsAndIDs("Guardian", 4, "", gvMission.Guardian)

	-- Disable ai for guardians and make them invulnerable
	local i
	for i=1,table.getn(gvMission.Guardian) do
		AI.Army_EnableLeaderAi(gvMission.Guardian[i].ID, 0)
		Logic.SetEntityInvulnerabilityFlag(gvMission.Guardian[i].ID, 1)
	end
	
	-- Create bishop trigger
	GlobalMissionScripting.RequestTrigger("MeetBishop")
	
	-- Create Bishops Guardians Message trigger
	gvMission.TriggerID_GiveBishopsGuardiansMessage = GlobalMissionScripting.RequestTrigger("GiveBishopsGuardiansMessage")

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.BishopPos.X, gvMission.BishopPos.Y, 0)
	Explore.Show("Bishop_Explore", gvMission.BishopPos, 2000)
	
end

function BishopStartFleeing()

	--Create table with bishops flee points
	gvMission.FleePoints = {}

	-- Fill up table with Positions and Ids from entities
	GlobalMissionScripting.GetPositionsAndIDs("Bishop_FleePoint", 5, "", gvMission.FleePoints)
	
	-- Send bishop to Flee Point 1
	Logic.MoveSettler(gvMission.Bishop, gvMission.FleePoints[1].X, gvMission.FleePoints[1].Y )
	
	gvMission.TriggerID_FleePoint = GlobalMissionScripting.RequestTrigger("BishopFleePoint1")

	-- Set fleeing flag, to prevent starting fleeing twice
	gvMission.BishopFlees = true
	
	-- start checking for player unit near after 20 seconds
	GlobalMissionScripting.RequestTrigger("WaitForCatchBishop")
end

------------------------------------------------------------------------------------------------
function Condition_MeetBishop()
	-- Is Dario, Erec or Healias near Bishop
	return 		Logic.CheckEntitiesDistance(getLeadingHero(), gvMission.Bishop, 1000 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Erec, gvMission.Bishop, 1000 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Helias, gvMission.Bishop, 1000 ) == 1
end
function Action_MeetBishop()

	-- Remove move minimap marker and Exploration
	GUI.DestroyMinimapPulse(gvMission.BishopPos.X, gvMission.BishopPos.Y)
	Explore.Hide("Bishop_Explore")
	
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_bishop_note"), 20)                           
	Logic.AddQuest(gvMission.PlayerID, 4, 0, "CM01_04_Crawford_Txt/mission_bishop_name", "CM01_04_Crawford_Txt/mission_bishop_desc")
		
		
	-- Create tribute
	Logic.AddTribute(gvMission.PlayerID, 1, 0, 0, "CM01_04_Crawford_Txt/tribute1_bishop", ResourceType.Gold, 10000)
	
	-- Wait for paying tribute
	gvMission.TriggerID_BishopTributePaid = Trigger.RequestTrigger(	Events.LOGIC_EVENT_TRIBUTE_PAID,
																	"Condition_BishopTributePaid",
																	"Action_BishopTributePaid",
																	1 )

	-- Create trigger for tribute not paid condition
	gvMission.TriggerID_TributeNotPaid = GlobalMissionScripting.RequestTrigger( "TributeNotPaid" )
				
	-- Move bishop near hq
	Logic.MoveSettler(gvMission.Bishop, gvMission.rangeCheckPos.X, gvMission.rangeCheckPos.Y)
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_BishopTributePaid()
	-- Is bishop tribute
	return Event.GetTributeUniqueID() == 1
end
function Action_BishopTributePaid()
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop2_note"), 20)
	
	-- Remove Bishop Quest
	Logic.RemoveQuest(gvMission.PlayerID, 4)
		
	--Get Bishop Position
	gvMission.BishopPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Bishop, gvMission.BishopPos)

	-- Create move minimap marker and Exploration
	GUI.ScriptSignal(gvMission.BishopPos.X, gvMission.BishopPos.Y, 0)

	
	-- disable not paid trigger
	Trigger.UnrequestTrigger(gvMission.TriggerID_TributeNotPaid)
	
	-- Start fleeing
	BishopStartFleeing()
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_WaitForCatchBishop()
	return Counter.Tick2("WaitForCatchBishop", 20)
end

function Action_WaitForCatchBishop()
	-- Remember id to disable player catch if guardians are faster
	gvMission.TriggerID_CatchBishop = GlobalMissionScripting.RequestTrigger("CatchBishop")
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_CatchBishop()
	-- Is Dario, Erec or Healias near Bishop
	return 	Logic.CheckEntitiesDistance(getLeadingHero(), gvMission.Bishop, 600 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Erec, gvMission.Bishop, 600 ) == 1
		or	Logic.CheckEntitiesDistance(gvMission.Helias, gvMission.Bishop, 600 ) == 1
end
function Action_CatchBishop()
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop3_note"), 10)           
	
	-- Activates attacks from OO3
	GlobalMissionScripting.RequestTrigger("AttackController_OO3")
	
	-- Create resource gold
	GlobalMissionScripting.GiveResouces(gvMission.PlayerID, 2500 )
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop4_note"), 10) 
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop5_note"), 10) 
	
	-- trigger : send guardians to bishops pos and take him to the barracks
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop6_note"), 10) 
	
	-- Stop bishop
	Logic.SettlerStand(gvMission.Bishop)
	
	-- Disable flee trigger
	Trigger.UnrequestTrigger(gvMission.TriggerID_FleePoint)
	
	-- Guardians follow bishop
	-- follow bishop trigger
	gvMission.TriggerID_GuardianFollowBishop = GlobalMissionScripting.RequestTrigger("GuardianFollowBishop")
	
	-- Create trigger wait for guardian near bishop this trigger sends bishop to barracks
	-- this trigger is also used if guardians catch bishop
	GlobalMissionScripting.RequestTrigger("BishopToBarracks")
	
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_BishopFleePoint1()
	-- Is bishop near
	return Logic.CheckEntitiesDistance(gvMission.Bishop, gvMission.FleePoints[1].ID, 1000)
end
function Action_BishopFleePoint1()
	-- Next flee point
	Logic.MoveSettler(gvMission.Bishop, gvMission.FleePoints[2].X, gvMission.FleePoints[2].Y )
	-- Show info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop7_note"), 10) 

	
	--Get Bishop Position
	gvMission.BishopPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Bishop, gvMission.BishopPos)	

	-- Create move minimap marker and Exploration
	GUI.ScriptSignal(gvMission.BishopPos.X, gvMission.BishopPos.Y, 0)
	
	gvMission.TriggerID_FleePoint = GlobalMissionScripting.RequestTrigger("BishopFleePoint2")
				
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_BishopFleePoint2()
	-- Is bishop near
	return Logic.CheckEntitiesDistance(gvMission.Bishop, gvMission.FleePoints[2].ID, 1000)
end
function Action_BishopFleePoint2()
	-- Next flee point
	Logic.MoveSettler(gvMission.Bishop, gvMission.FleePoints[3].X, gvMission.FleePoints[3].Y )
	-- Show info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop7_note"), 10) 
		
	--Get Bishop Position
	gvMission.BishopPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Bishop, gvMission.BishopPos)	

	-- Remove marker and exploration
	GUI.ScriptSignal(gvMission.BishopPos.X, gvMission.BishopPos.Y, 0)
	
	gvMission.TriggerID_FleePoint = GlobalMissionScripting.RequestTrigger("BishopFleePoint3")
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_BishopFleePoint3()
	-- Is bishop near
	return Logic.CheckEntitiesDistance(gvMission.Bishop, gvMission.FleePoints[3].ID, 1000)
end
function Action_BishopFleePoint3()
	-- Next flee point
	Logic.MoveSettler(gvMission.Bishop, gvMission.FleePoints[4].X, gvMission.FleePoints[4].Y )
	
	-- Show info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop7_note"), 10) 
	
	--Get Bishop Position
	gvMission.BishopPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Bishop, gvMission.BishopPos)	

	-- Create move minimap marker and Exploration
	GUI.ScriptSignal(gvMission.BishopPos.X, gvMission.BishopPos.Y, 0)
	
	gvMission.TriggerID_FleePoint = GlobalMissionScripting.RequestTrigger("BishopFleePoint4")
	
	-- Move guardians near last point
	local GuardianPos = gvMission.FleePoints[5]
	-- Modify position for guardian 1
	GuardianPos.X = GuardianPos.X + 100

	-- Send guardian 1
	Logic.MoveSettler(gvMission.Guardian[1].ID, GuardianPos.X, GuardianPos.Y )

	-- Modify position for guardian 2
	GuardianPos.X = GuardianPos.X - 200

	-- Send guardian 2
	Logic.MoveSettler(gvMission.Guardian[2].ID, GuardianPos.X, GuardianPos.Y )
	
	return 1				
end				
------------------------------------------------------------------------------------------------
function Condition_BishopFleePoint4()
	-- Is bishop near
	return Logic.CheckEntitiesDistance(gvMission.Bishop, gvMission.FleePoints[4].ID, 1000)
end
function Action_BishopFleePoint4()
	-- Next flee point
	Logic.MoveSettler(gvMission.Bishop, gvMission.FleePoints[5].X, gvMission.FleePoints[5].Y )
	-- Show info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop8_note"), 10) 
	
	--Get Bishop Position
	gvMission.BishopPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Bishop, gvMission.BishopPos)	

	-- Create move minimap marker and Exploration
	GUI.ScriptSignal(gvMission.BishopPos.X, gvMission.BishopPos.Y, 0)
	
	--create trigger for guardians check
	gvMission.TriggerID_FleePoint = GlobalMissionScripting.RequestTrigger("BishopGuardianCheck")
				
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_BishopGuardianCheck()
	-- Is near town exit
	return Logic.CheckEntitiesDistance(gvMission.Bishop, gvMission.FleePoints[5].ID, 100)
end
function Action_BishopGuardianCheck()
	-- Stop bishop
	Logic.SettlerStand(gvMission.Bishop)
	
	-- Show cutscene
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop9_note"), 20) 
	
	-- Activates attacks from OO3
	GlobalMissionScripting.RequestTrigger("AttackController_OO3")
	
	-- Disable catch for player
	Trigger.UnrequestTrigger(gvMission.TriggerID_CatchBishop)
	
	-- follow bishop trigger
	gvMission.TriggerID_GuardianFollowBishop = GlobalMissionScripting.RequestTrigger("GuardianFollowBishop")
	
	-- Remove blocking at north gate
	
	-- Create trigger wait for guardian near bishop this trigger sends bishop to barracks
	-- this trigger is also used if guardians catch bishop
	GlobalMissionScripting.RequestTrigger("BishopToBarracks")
	
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_GuardianFollowBishop()
	return 1
end
function Action_GuardianFollowBishop()
	-- Get bishops position
	local BishopPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.Bishop, BishopPos)
		
	-- Modify position for guardian 1
	BishopPos.X = BishopPos.X + 100

	-- Send guardian 1
	Logic.MoveSettler(gvMission.Guardian[1].ID, BishopPos.X, BishopPos.Y )

	-- Modify position for guardian 2
	BishopPos.X = BishopPos.X - 200

	-- Send guardian 2
	Logic.MoveSettler(gvMission.Guardian[2].ID, BishopPos.X, BishopPos.Y )

	return 0
end

------------------------------------------------------------------------------------------------
function Condition_BishopToBarracks()
	return 		Logic.CheckEntitiesDistance(gvMission.Guardian[1].ID, gvMission.Bishop, 400 ) == 1
		and	Logic.CheckEntitiesDistance(gvMission.Guardian[2].ID, gvMission.Bishop, 400 ) == 1
end
function Action_BishopToBarracks()
	Logic.MoveSettler(gvMission.Bishop, gvMission.BaracksPos.X, gvMission.BaracksPos.Y )
	
	GlobalMissionScripting.RequestTrigger("DeleteBishop")
	return 1
end
------------------------------------------------------------------------------------------------
function Condition_DeleteBishop()
	return Logic.CheckEntitiesDistance(gvMission.Bishop, gvMission.Baracks, 50 )
end
function Action_DeleteBishop()
	Logic.DestroyEntity(gvMission.Bishop)
	
	Trigger.UnrequestTrigger(gvMission.TriggerID_GuardianFollowBishop)

	-- Remove blocking
	Logic.DestroyEntity(gvMission.block)
	
	-- remove bishops guardian message trigger 
	Trigger.UnrequestTrigger(gvMission.TriggerID_GiveBishopsGuardiansMessage)

	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission3_note"), 20)                                   
	Logic.AddQuest(gvMission.PlayerID, 5, 0, "CM01_04_Crawford_Txt/mission3_name", "CM01_04_Crawford_Txt/mission3_desc")
	
	--Get Black Knight Position
	gvMission.BNPos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.BN, gvMission.BNPos)	

	-- Create move minimap marker and Exploration
	GUI.CreateMinimapPulse(gvMission.BNPos.X, gvMission.BNPos.Y, 2)
	Explore.Show("BN_Explore", gvMission.BNPos, 2000)
		
	-- Enable ai for first both guardians and remove invulnerability
	local i
	for i=1,table.getn(gvMission.Guardian) do
		AI.Army_EnableLeaderAi(gvMission.Guardian[i].ID, 1)
		Logic.SetEntityInvulnerabilityFlag(gvMission.Guardian[i].ID, 0)
	end
	
	Logic.MoveSettler(gvMission.Guardian[3].ID, gvMission.Outpost3.Position.X, gvMission.Outpost3.Position.Y)
	Logic.MoveSettler(gvMission.Guardian[4].ID, gvMission.Outpost3.Position.X, gvMission.Outpost3.Position.Y)
	
	GlobalMissionScripting.RemoveEntityInFog(gvMission.PlayerID, gvMission.Guardian[3].ID)
	GlobalMissionScripting.RemoveEntityInFog(gvMission.PlayerID, gvMission.Guardian[4].ID)
	
	return 1
end
------------------------------------------------------------------------------------------------

function Condition_TributeNotPaid()
	-- are all 4 OO towers destroyed
	return 	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO2_Tower[1].ID)
		and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO2_Tower[2].ID)
		and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO1_Tower[1].ID)
		and	GlobalMissionScripting.IsEntityDestroyed(gvMission.OO1_Tower[1].ID)
end
function Action_TributeNotPaid()
	-- Info
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop10_note"), 20) 
                                                                                            
	-- Remove tribute
	Logic.RemoveTribute(gvMission.PlayerID, 1)
	
	-- Disable tribute trigger
	Trigger.UnrequestTrigger(gvMission.TriggerID_BishopTributePaid)
	
	-- Start fleeing
	BishopStartFleeing()
	return 1
end

------------------------------------------------------------------------------------------------

function Condition_GiveBishopsGuardiansMessage()
        -- IsPlayerEntityInArea :    For a specified player, check if any entity is in the passed area
        -- Param1: The Player ID; Param2: X position near which to search;Param3: Y position near which to search
        -- Param4: Range to search - in centi meter, Return: 1: entity in area; 0: no entity in area
	return Logic.IsPlayerEntityInArea(PlayerID, gvMission.TownExitPos.X, gvMission.TownExitPos.Y, 600)
end

function Action_GiveBishopsGuardiansMessage()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_04_Crawford_Txt/mission_Bishop11_note"), 20) 
	return 1
end
