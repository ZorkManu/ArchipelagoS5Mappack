--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitLeonardoFunctions()	
	-- Leonardo Globals
	gvMission_HeroLeonardo  	  = Logic.GetEntityIDByName("Leonardo")
	gvMission_LeonardoLookForTreasure = 0
	gvMission_LeonardoFindStonePlace  = 0
	gvMission_Avalanche1		= Logic.GetEntityIDByName("Avalanche1")
	gvMission_Avalanche2		= Logic.GetEntityIDByName("Avalanche2")
	gvMission_Avalanche3		= Logic.GetEntityIDByName("Avalanche3")
	
	-- Leonardo go to Player
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeonardoArriveToPlayer"))
	Logic.MoveSettler(gvMission_HeroLeonardo, X, Y, -1)	
	
	gvMission_LeoCP1X, gvMission_LeoCP1Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint1"))
	gvMission_LeoCP2X, gvMission_LeoCP2Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint2"))
	gvMission_LeoCP3X, gvMission_LeoCP3Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint3"))
	gvMission_LeoCP4X, gvMission_LeoCP4Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint4"))
	gvMission_LeoCP5X, gvMission_LeoCP5Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint5"))												
	gvMission_LeoCP6X, gvMission_LeoCP6Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint6"))
	gvMission_LeoCP7X, gvMission_LeoCP7Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint7"))
	gvMission_LeoCP8X, gvMission_LeoCP8Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint8"))
	gvMission_LeoCP9X, gvMission_LeoCP9Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint9"))
	gvMission_LeoCP10X, gvMission_LeoCP10Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint10"))
	gvMission_LeoCP11X, gvMission_LeoCP11Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint11"))
	gvMission_LeoCP12X, gvMission_LeoCP12Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeoCheckpoint12"))
	
	gvMission_LeonardoThanks = Logic.GetEntityIDByName("LeonardoThanks")
	-----------------------------------------------------------------
	GlobalMissionScripting.RequestTrigger( "LeonardoArriveToPlayer" )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_LeonardoArriveToPlayer()
	return Counter.Tick2("finAriBed", 1) -- 1 second
end
function Action_LeonardoArriveToPlayer()
	-- pass check entity
	if Logic.CheckEntitiesDistance(Logic.GetEntityIDByName("LeonardoArriveToPlayer"), gvMission_HeroLeonardo, 600) == 1 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/NPC_Leonardo_Start_001"))
		GlobalMissionScripting.RequestTrigger( "LeonardoSpeaksToPlayer1" )
		GlobalMissionScripting.RequestTrigger( "LeonardoSpeaksToPlayer2" )
		
		GlobalMissionScripting.RequestTrigger( "LeonardoLookForTreasure" )
		return 1
	end
end
function Condition_LeonardoSpeaksToPlayer1()
	return Counter.Tick2("LeonardoSpeaksToPlayer1", 7) -- 5 second
end
function Action_LeonardoSpeaksToPlayer1()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/NPC_Leonardo_Start_002"))
	return 1
end
function Condition_LeonardoSpeaksToPlayer2()
	return Counter.Tick2("LeonardoSpeaksToPlayer2", 14) -- 10 second
end
function Action_LeonardoSpeaksToPlayer2()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/NPC_Leonardo_Start_003"))
	GlobalMissionScripting.RequestTrigger( "LeonardoFindStonePlace" )
	
	Logic.AddQuest(gvMission_PlayerID, 001, 1, "CM01_06_Cleycourt_Txt/subquest001_name_FindCleycourt", "CM01_06_Cleycourt_Txt/subquest001_desc_FindCleycourt")
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	return 1
end
----------------------------------------------------------------------------------------------
function Condition_LeonardoLookForTreasure()
	return Counter.Tick2("LeonardoLookForTreasure", 20) -- 20 second
end
function Action_LeonardoLookForTreasure()
	if gvMission_LeonardoFindStonePlace == 1 then
		return 1 -- muß vor den unteren Befehlen ausgeführt werden, da sonst wieder von dem Steinplatzt wegeschickt werden könnte
	end

	-- ACHTUNG der GetRandom Befehl fängt von 0 an
	gvMission_LeonardoLookForTreasure = Logic.GetRandom(11)--+1   -- +1 wenn man möchte daß die RandomFunktion von 1 aus anfangen soll 
	
	if gvMission_LeonardoLookForTreasure == 0 then		
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP1X, gvMission_LeoCP1Y, -1)		
	end
	if gvMission_LeonardoLookForTreasure == 1 then		
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP2X, gvMission_LeoCP2Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 2 then				
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP3X, gvMission_LeoCP3Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 3 then		
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP4X, gvMission_LeoCP4Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 4 then		
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP5X, gvMission_LeoCP5Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 5 then
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP6X, gvMission_LeoCP6Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 6 then
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP7X, gvMission_LeoCP7Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 7 then
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP8X, gvMission_LeoCP8Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 8 then
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP9X, gvMission_LeoCP9Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 9 then
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP10X, gvMission_LeoCP10Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 10 then
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP11X, gvMission_LeoCP11Y, -1)
	end
	if gvMission_LeonardoLookForTreasure == 11 then
		Logic.MoveSettler(gvMission_HeroLeonardo, gvMission_LeoCP12X, gvMission_LeoCP12Y, -1)
	end
end
----------------------------------------------------------------------------------------------
function Condition_LeonardoFindStonePlace()
	return Counter.Tick2("LeonardoFindStonePlace", 900) -- 15 minutes
end
function Action_LeonardoFindStonePlace()
	gvMission_LeonardoFindStonePlace = 1 -- damit Leonardo keine Schätze mehr sucht
	
	Logic.SetOnScreenInformation(gvMission_HeroLeonardo, 1)
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("LeonardoFindStonePlace"))
	Logic.MoveSettler(gvMission_HeroLeonardo, X, Y, -1)	
	GlobalMissionScripting.RequestTrigger( "PlayerFindLeonardoAtStoneplace" )	
	return 1
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_PlayerFindLeonardoAtStoneplace()
	return Counter.Tick2("PlayerFindLeonardoAtStoneplace", 2) -- 2 second
end
function Action_PlayerFindLeonardoAtStoneplace()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("LeonardoFindStonePlace"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1000, 1 )
	if checknum == 1 then
		Logic.SetOnScreenInformation(gvMission_HeroLeonardo, 0)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/NPC_Leonardo_StonePlace_001"))		
		GlobalMissionScripting.RequestTrigger( "LeonardoSpeaksStonePlace" )		
		
		GlobalMissionScripting.RequestTrigger( "CheckWeathermachine" )		
		return 1
	end
end
function Condition_LeonardoSpeaksStonePlace()
	return Counter.Tick2("LeonardoSpeaksStonePlace", 5) -- 5 second
end
function Action_LeonardoSpeaksStonePlace()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/NPC_Leonardo_StonePlace_002"))
	Logic.AddQuest(gvMission_PlayerID, 002, 1, "CM01_06_Cleycourt_Txt/subquest_002_name_LeonardoNeedHelp", "CM01_06_Cleycourt_Txt/subquest_002_desc_LeonardoNeedHelp")
	
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	GlobalMissionScripting.RequestTrigger( "LeonardoThanks" )
	return 1
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_LeonardoThanks()
	return Counter.Tick2("LeonardoThanks", 2) -- 5 second
end
function Action_LeonardoThanks()
	--local X, Y 	= Logic.GetEntityPosition(gvMission_LeonardoThanks)
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	--local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 500, 1 )
	--if checknum == 1 then
	local Avalanche1 = Logic.IsEntityDestroyed(gvMission_Avalanche1)
	local Avalanche2 = Logic.IsEntityDestroyed(gvMission_Avalanche2)
	local Avalanche3 = Logic.IsEntityDestroyed(gvMission_Avalanche3)
	if Avalanche1 == true
	or Avalanche2 == true
	or Avalanche3 == true then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/NPC_Leonardo_Thanks"))
		Logic.RemoveQuest(gvMission_PlayerID, 002) -- die nicht mehr benötigte Quest löschen
		
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("Machine"))
		Logic.MoveSettler(gvMission_HeroLeonardo, X, Y, -1)	
		return 1
	end
end