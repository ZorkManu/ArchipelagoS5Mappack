--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitAriFunctions()
	-- Ari Globals
	gvMission_HeroAri  	= Logic.GetEntityIDByName("Ari")
	gvMission_AriLeader1	= Logic.GetEntityIDByName("AriLeader1")
	gvMission_AriLeader2	= Logic.GetEntityIDByName("AriLeader2")
	gvMission_AriLeader3	= Logic.GetEntityIDByName("AriLeader3")
	
	gvMission_AriMuggedPlayer	= 1
	gvMission_findAriCamp		= 0
	gvMission_FindKeyChest		= 0
	gvMission_ArisBed		= Logic.GetEntityIDByName("findAriBed1")
	gvMission_ArisGate1		= Logic.GetEntityIDByName("AriGate1")
	gvMission_ArisGate2		= Logic.GetEntityIDByName("AriGate2")
	gvMission_AriKeyTip		= 0
	AriKeyTipPosX, AriKeyTipPosY	= Logic.GetEntityPosition(Logic.GetEntityIDByName("AriKeyTip"))
	
	gvMission_SpawnBarmeciaTroopID1 = 0
	gvMission_SpawnBarmeciaTroopID2 = 0
	gvMission_SpawnBarmeciaTroopID3 = 0
	---------------------------------------------------------------
	GlobalMissionScripting.RequestTrigger( "AriMuggedPlayer" )
	GlobalMissionScripting.RequestTrigger( "Arifind" )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_Arifind()
	return Counter.Tick2("Arifind", 2) -- 3 second
end
function Action_Arifind()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("Ari_find"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1000, 1 )
	if checknum == 1 then	
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_Arifind"))
	
		GlobalMissionScripting_AttachSoldiersToLeader("AriLeader1",6)
		GlobalMissionScripting_AttachSoldiersToLeader("AriLeader2",6)
		GlobalMissionScripting_AttachSoldiersToLeader("AriLeader3",6)
		
		-- Move Ari away
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriBack"))
		Logic.MoveSettler(gvMission_HeroAri, X, Y, -1)		
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriBackLeader1"))	
		Logic.GroupAttackMove(gvMission_AriLeader1, X,Y, -1)
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriBackLeader2"))	
		Logic.GroupAttackMove(gvMission_AriLeader2, X,Y, -1)
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriBackLeader3"))	
		Logic.GroupAttackMove(gvMission_AriLeader3, X,Y, -1)
		
		GlobalMissionScripting.RequestTrigger( "findAriBed" )
		return 1
	end
end
----------------------------------------------------------------------------------------------
function Condition_findAriBed()
	return Counter.Tick2("findAriBed", 1) -- 3 second
end
function Action_findAriBed()
	local X, Y 	= Logic.GetEntityPosition(gvMission_ArisBed)
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1200, 1 )
	if checknum == 1 then
		local GateX, GateY 	= Logic.GetEntityPosition(gvMission_ArisGate1)
		local ArisGate1 = Logic.CreateEntity(Entities.XD_PalisadeGate1, GateX,GateY, 90, 0)
		Logic.DestroyEntity(gvMission_ArisGate1)
		gvMission_ArisGate1 = ArisGate1
		
		local x, y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("AriKeyTip"))
		gvMission_AriKeyTip = Logic.CreateEntity(Entities.PU_Selrf,x,y,75,gvMission_PlayerID)
		Logic.SetOnScreenInformation(gvMission_AriKeyTip, 1)
		GlobalMissionScripting.RequestTrigger( "AriKeyTip" )
		
		if gvMission_FindKeyChest == 0 then
			GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_AriBed"))
			Logic.AddQuest(gvMission_PlayerID, 003, 1, "CM01_06_Cleycourt_Txt/subquest003_name_Ari", "CM01_06_Cleycourt_Txt/subquest003_desc_Ari2")
			GlobalMissionScripting.RequestTrigger( "openArisGate1" )			
		else
			GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_AriBed2"))
			GlobalMissionScripting.RequestTrigger( "openArisGate1" )
		end
		if gvMission_FindBarmecia == 0 then
			GlobalMissionScripting.RequestTrigger( "BarmeciaTip" )
		end
		gvMission_findAriCamp = 1
		return 1
	end
end
function Condition_BarmeciaTip()
	return Counter.Tick2("BarmeciaTip", 7) -- 7 second
end
function Action_BarmeciaTip()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_AriBed3"))
	Logic.AddQuest(gvMission_PlayerID, 003, 1, "CM01_06_Cleycourt_Txt/subquest003_name_Ari", "CM01_06_Cleycourt_Txt/subquest003_desc_Ari3")
	return 1
end
function Condition_BarmeciaTip()
	return Counter.Tick2("AriKeyTip", 3) -- 3 second
end
function Action_AriKeyTip()
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, AriKeyTipPosX,AriKeyTipPosY, 600, 1 )
	if checknum == 1 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest003_note_ArisKeyTip"))
		Logic.SetOnScreenInformation(gvMission_AriKeyTip, 0)
		return 1
	end
end
----------------------------------------------------------------------------------------------
function Condition_openArisGate1()
	return Counter.Tick2("openArisGate1", 5) -- 5 second
end
function Action_openArisGate1()
	if gvMission_FindBarmecia == 1
	and gvMission_FindKeyChest == 1 then	
		local X, Y 	= Logic.GetEntityPosition(gvMission_ArisBed)
		--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
		local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 800, 1 )
		if checknum == 1 then	
			local Gate1X, Gate1Y 	= Logic.GetEntityPosition(gvMission_ArisGate1)
			local ArisGate1 = Logic.CreateEntity(Entities.XD_PalisadeGate2, Gate1X,Gate1Y, 90, 0)
			Logic.DestroyEntity(gvMission_ArisGate1)
			gvMission_ArisGate1 = ArisGate1
			
			local Gate2X, Gate2Y 	= Logic.GetEntityPosition(gvMission_ArisGate2)
			local ArisGate2 = Logic.CreateEntity(Entities.XD_PalisadeGate2, Gate2X,Gate2Y, 35, 0)
			Logic.DestroyEntity(gvMission_ArisGate2)
			gvMission_ArisGate2 = ArisGate2
			
			Mission_SpawnBarmeciaTroop()	
			return 1
		end
	end
end
----------------------------------------------------------------------------------------------
function Mission_SpawnBarmeciaTroop()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("SpawnBarmeciaID1"))
	-- kreiere für den Player "5", die Einheit "PU_LeaderSword1" davon "12" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroopID1 = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderPoleArm2, 6, x, y, 0 )
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroopID1, 1 )
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMovePoint1"))
	Logic.MoveSettler(gvMission_SpawnBarmeciaTroopID1, X, Y, -1)

	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("SpawnBarmeciaID2"))
	-- kreiere für den Player "5", die Einheit "PU_LeaderSword1" davon "12" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroopID2 = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderPoleArm2, 6, x, y, 0 )
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroopID2, 1 )
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMovePoint2"))
	Logic.MoveSettler(gvMission_SpawnBarmeciaTroopID2, X, Y, -1)
	
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("SpawnBarmeciaID3"))
	-- kreiere für den Player "5", die Einheit "PU_LeaderSword1" davon "12" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroopID3 = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderSword2, 6, x, y, 0 )
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroopID3, 1 )
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMovePoint3"))
	Logic.MoveSettler(gvMission_SpawnBarmeciaTroopID3, X, Y, -1)
	
	GlobalMissionScripting.RequestTrigger( "CheckBarmeciaTroopAtAri" )
end
function Condition_CheckBarmeciaTroopAtAri()
	return Counter.Tick2("CheckBarmeciaTroopAtAri", 3) -- 3 second
end
function Action_CheckBarmeciaTroopAtAri()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMovePoint1"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_BarmeciaID ,0, X,Y, 800, 1 )
	if checknum == 1 then		
		--local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriMoveToBarmecia"))
		--Logic.MoveSettler(gvMission_HeroAri, X, Y, -1)
		
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("TroopMoveToBarmecia1"))
		Logic.MoveSettler(gvMission_SpawnBarmeciaTroopID1, X, Y, -1)
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("TroopMoveToBarmecia2"))
		Logic.MoveSettler(gvMission_SpawnBarmeciaTroopID2, X, Y, -1)
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("TroopMoveToBarmecia3"))
		Logic.MoveSettler(gvMission_SpawnBarmeciaTroopID3, X, Y, -1)
	
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest003_AriCapture"))
			
		GlobalMissionScripting.RequestTrigger( "CheckAriAtBarmecia" )						
		return 1
	end		
end

function Condition_CheckAriAtBarmecia()
	local X, Y = Logic.GetEntityPosition(gvMission_SpawnBarmeciaTroopID3)
	Logic.MoveSettler(gvMission_HeroAri, X-175, Y-50, -1)
	
	if Logic.CheckEntitiesDistance(Logic.GetEntityIDByName("TroopMoveToBarmecia3"), gvMission_SpawnBarmeciaTroopID3, 600) == 1 then
		return 1
	end
end
function Action_CheckAriAtBarmecia()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest003_AriAtPrison"))	
	GlobalMissionScripting.RequestTrigger( "AddUniQuest" )
	
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriMoveToBarmecia"))
	Logic.MoveSettler(gvMission_HeroAri, X, Y, -1)
	GlobalMissionScripting.RequestTrigger( "CheckAriAtPrison" )
	
	return 1
end
function Condition_CheckAriAtPrison()
	if Logic.CheckEntitiesDistance(Logic.GetEntityIDByName("AriMoveToBarmecia"), gvMission_HeroAri, 300) == 1 then
			return 1
		end
end
function Action_CheckAriAtPrison()
	Logic.AddQuest(gvMission_PlayerID, 003, 1, "CM01_06_Cleycourt_Txt/subquest003_name_AriAtPrison", "CM01_06_Cleycourt_Txt/subquest003_desc_AriAtPrison")
	Logic.DestroyEntity(gvMission_HeroAri)
end
function Condition_AddUniQuest()
	return Counter.Tick2("AddUniQuest", 9) -- 9 second
end
function Action_AddUniQuest()
	Mission_AddQuestUniversityAtBarmecia()
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
function Condition_AriMuggedPlayer()
	return Counter.Tick2("AriMuggedPlayer", 420) -- 7 minutes
end
function Action_AriMuggedPlayer()
	if gvMission_findAriCamp == 1 then
		return 1 -- muß vor den unteren Befehlen ausgeführt werden, da sonst trotzdem eine letzes mal Ari was dem Spieler stehlen könnte
	end
	
	-- ACHTUNG der GetRandom Befehl fängt von 0 an
	gvMission_AriMuggedPlayer = Logic.GetRandom(3)+1   -- +1 wenn man möchte daß die RandomFunktion von 1 aus anfangen soll 	
	
	if gvMission_AriMuggedPlayer == 1 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_AriMuggedPlayerGold"))
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, -50)
		--Logic.SubFromPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, -50)
	end
	if gvMission_AriMuggedPlayer == 2 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_AriMuggedPlayerWood"))	
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Wood, -100)
		--Logic.SubFromPlayersGlobalResource(gvMission_PlayerID, ResourceType.Wood, -100)
	end
	if gvMission_AriMuggedPlayer == 3 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_AriMuggedClay"))	
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Clay, -75)
		--Logic.SubFromPlayersGlobalResource(gvMission_PlayerID, ResourceType.Clay, -75)
	end
end