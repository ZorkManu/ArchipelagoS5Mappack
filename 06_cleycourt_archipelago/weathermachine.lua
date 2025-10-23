--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitWeathermachineFunctions()
	-- Leonardo Globals
	gvMission_WeathermachineAlive 		= Logic.GetEntityIDByName("Weathermachine")
	gvMission_PlayerFindWeathermachine 	= 0
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_CheckWeathermachine()
	return Counter.Tick2("CheckWeathermachine", 4) -- 4 second
end
function Action_CheckWeathermachine()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("Machine"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 1000, 1 )
	if checknum == 1 then
		gvMission_PlayerFindWeathermachine = 1
		-- Change CheckWeathermachine to Player
		gvMission_WeathermachineAlive = Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("Weathermachine"), gvMission_PlayerID)
		Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("WeatherEnergy1"), gvMission_PlayerID)
		Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("WeatherEnergy2"), gvMission_PlayerID)
	
		GlobalMissionScripting.RequestTrigger( "Movie_Weathermachine" )
		GlobalMissionScripting.RequestTrigger( "LostWeathermachineCondition" )
		return 1
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_LostWeathermachineCondition()
	return Counter.Tick2("LostWeathermachineCondition", 5) -- 5 second
end
function Action_LostWeathermachineCondition()
	-- wurde die Wettermaschie zerstört
	if GlobalMissionScripting.IsEntityAlive(gvMission_WeathermachineAlive) == false then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/Mainquest_LostWeathermachine"))
		Logic.RemoveQuest(gvMission_PlayerID, 004) -- die nicht mehr benötigte Quest löschen
		
		GlobalMissionScripting.RequestTrigger( "LostGame" )				
		return 1
	end
end