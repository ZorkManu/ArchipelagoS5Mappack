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
	gvMission_HeroLeonardo							= Logic.GetEntityIDByName("Leonardo")
	gvMission_LeonardoPosX, gvMission_LeonardoPosY 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("Leonardo"))
	Logic.SetOnScreenInformation(gvMission_HeroLeonardo, 1)
	gvMission_LeonardoTribute1 = 0
	gvMission_LeonardoTribute2 = 0
	gvMission_LeonardoTribute3 = 0
	gvMission_LeonardoTribute4 = 0
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_FindLeonardo()
	return Counter.Tick2("FindLeonardo", 3) -- 3 second
end
function Action_FindLeonardo()
	--PlayerID, 0 f�r pr�fe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten m��en
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, gvMission_LeonardoPosX,gvMission_LeonardoPosY, 800, 1 )
	if checknum == 1 then
		Logic.SetOnScreenInformation(gvMission_HeroLeonardo, 0)
		Mission_findLeonardoMovie()
		return 1
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_LeonardoTribute()
	return Counter.Tick2("LeonardoTribute", 3) -- 3 second
end
function Action_LeonardoTribute()
	if gvMission_LeonardoTribute1 == 1 then
		gvMission_LeonardoTribute1 = 0 -- damit es nicht nochmals aufgerufen wird
		Mission_LeonardoWorkMovie()	
		GlobalMissionScripting.RequestTrigger( "LeonardoWorkspeaks1" )
	end
	if gvMission_LeonardoTribute2 == 1 then
		gvMission_LeonardoTribute2 = 0 -- damit es nicht nochmals aufgerufen wird
		Mission_LeonardoWorkMovie()	
		GlobalMissionScripting.RequestTrigger( "LeonardoWorkspeaks2" )
	end
	if gvMission_LeonardoTribute3 == 1 then
		gvMission_LeonardoTribute3 = 0 -- damit es nicht nochmals aufgerufen wird
		Mission_LeonardoWorkMovie()
		GlobalMissionScripting.RequestTrigger( "LeonardoWorkspeaks3" )
	end
	if gvMission_LeonardoTribute4 == 1 then
		gvMission_LeonardoTribute4 = 0 -- damit es nicht nochmals aufgerufen wird
		--Logic.RemoveQuest(gvMission_PlayerID, 002) -- die nicht mehr ben�tigte Quest l�schen
		Logic.AddQuest(gvMission_PlayerID, 002, 1, "CM01_07_Flood/subquest002_name_Leonardo_Resource", "CM01_07_Flood/subquest002_desc_Leonardo_Resource")		
		return 1 -- wenn der Spieler alles f�r Leonardo besorgt hat, wird dieser Trigger gel�scht
	end
end


function Condition_LeonardoWorkspeaks1()
	return Counter.Tick2("LeonardoWorkspeaks1", 3) -- 3 second
end
function Action_LeonardoWorkspeaks1()
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest002_note_Leonardo_Clay"))
		
		--Logic.RemoveQuest(gvMission_PlayerID, 002) -- die nicht mehr ben�tigte Quest l�schen
		Logic.AddQuest(gvMission_PlayerID, 002, 1, "CM01_07_Flood/subquest002_name_Leonardo_Clay", "CM01_07_Flood/subquest002_desc_Leonardo_Clay")	
		GlobalMissionScripting.RequestTrigger( "NewQuest" )
		
		Logic.AddTribute(gvMission_PlayerID, 002, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute002_Leonardo_Clay", ResourceType.Clay, 3000)
	return 1
end

function Condition_LeonardoWorkspeaks2()
	return Counter.Tick2("LeonardoWorkspeaks2", 3) -- 3 second
end
function Action_LeonardoWorkspeaks2()
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest002_note_Leonardo_Iron"))
		
		--Logic.RemoveQuest(gvMission_PlayerID, 002) -- die nicht mehr ben�tigte Quest l�schen
		Logic.AddQuest(gvMission_PlayerID, 002, 1, "CM01_07_Flood/subquest002_name_Leonardo_Iron", "CM01_07_Flood/subquest002_desc_Leonardo_Iron")	
		GlobalMissionScripting.RequestTrigger( "NewQuest" )
		Logic.AddTribute(gvMission_PlayerID, 003, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute003_Leonardo_Iron", ResourceType.Iron, 1000)
	return 1
end

function Condition_LeonardoWorkspeaks3()
	return Counter.Tick2("LeonardoWorkspeaks3", 3) -- 3 second
end
function Action_LeonardoWorkspeaks3()
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest002_note_Leonardo_Sulfur"))

		--Logic.RemoveQuest(gvMission_PlayerID, 002) -- die nicht mehr ben�tigte Quest l�schen
		
		if gvMission_findBarmeciaTrader == 0 then -- nur wenn den H�ndelr noch nicht in Bamrecia gefunden hat
			Logic.AddQuest(gvMission_PlayerID, 002, 1, "CM01_07_Flood/subquest002_name_Leonardo_Sulfur", "CM01_07_Flood/subquest002_desc_Leonardo_Sulfur")	
			GlobalMissionScripting.RequestTrigger( "NewQuest" )
		end
		Logic.AddTribute(gvMission_PlayerID, 004, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute004_Leonardo_Sulfur", ResourceType.Sulfur, 2000)
	return 1
end