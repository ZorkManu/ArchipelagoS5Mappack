--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitBarmeciaFunctions()	
	-- Barmecia Globals
	gvMission_BarmeciaCheck1 	= Logic.GetEntityIDByName("BarmeciaTown1")
	gvMission_BarmeciaCheck2 	= Logic.GetEntityIDByName("BarmeciaTown2")
	gvMission_BarmeciaCheck3 	= Logic.GetEntityIDByName("BarmeciaTown3")
	
	-- BarmeciaDefenceTroop
	gvMission_SpawnBarmeciaTroop1ID = 0
	gvMission_SpawnBarmeciaTroop2ID = 0
	gvMission_SpawnBarmeciaTroop3ID = 0
	
	gvMission_CheckUniversityPosX, gvMission_CheckUniversityPosY = Logic.GetEntityPosition(Logic.GetEntityIDByName("CheckUniversity"))
	gvMission_FindBarmecia		= 0

	-------------------------------------------------------------
	GlobalMissionScripting.RequestTrigger( "BarmeciaAliveTroops" )
	GlobalMissionScripting.RequestTrigger( "BarmeciaTroopsTakePosition" )
	GlobalMissionScripting.RequestTrigger( "FindBarmecia" )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_FindBarmecia()
	return Counter.Tick2("FindBarmecia", 2) -- 2 second
end
function Action_FindBarmecia()
	local X, Y 	= Logic.GetEntityPosition(gvMission_BarmeciaCheck1)
	--PlayerID, 0 f�r pr�fe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten m��en
	local checknum1 = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1000, 1 )
	
	local X, Y 	= Logic.GetEntityPosition(gvMission_BarmeciaCheck2)
	local checknum2 = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1000, 1 )

	local X, Y 	= Logic.GetEntityPosition(gvMission_BarmeciaCheck3)
	local checknum3 = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1000, 1 )
	
	if checknum1 ~= 0
	or checknum2 ~= 0
	or checknum3 ~= 0 then	
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest004_BarmeciaGreeting"))
		GlobalMissionScripting.RequestTrigger( "FindBarmeciaMayor" )
		
		-- Make on screen information
		Logic.SetOnScreenInformation(Logic.GetEntityIDByName("BarmeciaMayor"), 1)

		return 1
	end
end
----------------------------------------------------------------------------------------------
function Condition_FindBarmeciaMayor()
	return Counter.Tick2("FindBarmeciaMayor", 3) -- 3 second
end
function Action_FindBarmeciaMayor()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMayor"))
	--PlayerID, 0 f�r pr�fe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten m��en
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 800, 1 )
	if checknum == 1 then
		Logic.SetOnScreenInformation(Logic.GetEntityIDByName("BarmeciaMayor"), 0)
		Logic.RemoveQuest(gvMission_PlayerID, 007) -- die nicht mehr ben�tigte Quest l�schen
		
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest004_BarmeciaMayorSpeaks1"))
		GlobalMissionScripting.RequestTrigger( "BarmeciaMayorSpeaks1" )
		GlobalMissionScripting.RequestTrigger( "BarmeciaMayorSpeaks2" )
		
		gvMission_FindBarmecia = 1
		return 1
	end
end
function Condition_BarmeciaMayorSpeaks1()
	return Counter.Tick2("BarmeciaMayorSpeaks1", 9) -- 5 second
end
function Action_BarmeciaMayorSpeaks1()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest004_BarmeciaMayorSpeaks2"))
	return 1
end
function Condition_BarmeciaMayorSpeaks2()
	return Counter.Tick2("BarmeciaMayorSpeaks2", 18) -- 10 second
end
function Action_BarmeciaMayorSpeaks2()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest004_BarmeciaMayorSpeaks3"))
	
	-- add Ari Quest
	Logic.AddQuest(gvMission_PlayerID, 003, 1, "CM01_06_Cleycourt_Txt/subquest003_name_Ari", "CM01_06_Cleycourt_Txt/subquest003_desc_Ari1")
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	checkLocation("cleycourt_reach_barmecia")
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_BarmeciaAliveTroops()
	return 1 -- damit die Action_BarmeciaAliveTroops jedesmal aufgerufen wird
end
function Action_BarmeciaAliveTroops()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop1ID) == false then
		Mission_BarmeciaDefenceTroop1()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop2ID) == false then
		Mission_BarmeciaDefenceTroop2()
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop3ID) == false then
		Mission_BarmeciaDefenceTroop3()
	end
	-- return 1 darf nicht gesetzt werden	
end
function Mission_BarmeciaDefenceTroop1()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmBarracks"))
	-- kreiere f�r den Player "4", die Einheit "PU_LeaderSword2" davon "8" St�ck, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroop1ID = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderSword2, 6, x, y, 90 )	
	-- Formation �ndern
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroop1ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint1"))
	Logic.GroupAttackMove(gvMission_SpawnBarmeciaTroop1ID, X,Y, -1)
end
function Mission_BarmeciaDefenceTroop2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmBarracks"))
	-- kreiere f�r den Player "4", die Einheit "PU_LeaderPoleArm2" davon "8" St�ck, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderPoleArm2, 6, x, y, 90 )	
	-- Formation �ndern
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint2"))
	Logic.GroupAttackMove(gvMission_SpawnBarmeciaTroop2ID, X,Y, -1)
end
function Mission_BarmeciaDefenceTroop3()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmBarracks"))
	-- kreiere f�r den Player "4", die Einheit "PU_LeaderSword2" davon "8" St�ck, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroop3ID = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderSword2, 6, x, y, 90 )	
	-- Formation �ndern
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroop3ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint3"))
	Logic.GroupAttackMove(gvMission_SpawnBarmeciaTroop3ID, X,Y, -1)
end
function Condition_BarmeciaTroopsTakePosition()
	return Counter.Tick2("BarmeciaTroopsTakePosition", 30) -- 30 second	
end
function Action_BarmeciaTroopsTakePosition()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop1ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint1"))
		Logic.GroupAttackMove(gvMission_SpawnBarmeciaTroop1ID, X,Y, -1)
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop2ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint2"))
		Logic.GroupAttackMove(gvMission_SpawnBarmeciaTroop2ID, X,Y, -1)
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop3ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint3"))
		Logic.GroupAttackMove(gvMission_SpawnBarmeciaTroop3ID, X,Y, -1)
	end
	-- return 1 darf nicht gesetzt werden
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Mission_AddQuestUniversityAtBarmecia()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest006_note_BarmeciaUniversity1"))
	Logic.AddQuest(gvMission_PlayerID, 006, 1, "CM01_06_Cleycourt_Txt/subquest006_name_BarmeciaUniversity", "CM01_06_Cleycourt_Txt/subquest006_desc_BarmeciaUniversity")
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	GlobalMissionScripting.RequestTrigger( "CheckUniversityAtBarmecia" )

	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CheckUniversity"))
	GlobalMissionScripting.ExploreArea(X, Y, 13)	
	GUI.CreateMinimapPulse(X, Y, 1)
end

function Condition_CheckUniversityAtBarmecia()
	return Counter.Tick2("CheckUniversityAtBarmecia", 5) -- 5 second	
end
function Action_CheckUniversityAtBarmecia()
	local CheckUniversity = Logic.GetPlayerEntitiesInArea(gvMission_PlayerID, Entities.PB_University1, gvMission_CheckUniversityPosX, gvMission_CheckUniversityPosY, 1000, 1)
	if CheckUniversity == 1 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest006_note_BarmeciaUniversity2"))
		GlobalMissionScripting.RequestTrigger( "CheckUniversity2AtBarmecia" )		
			local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CheckUniversity"))
			GUI.DestroyMinimapPulse(X,Y)	
		return 1
		
	end
end
function Condition_CheckUniversity2AtBarmecia()
	return Counter.Tick2("CheckUniversity2AtBarmecia", 5) -- 5 second
end
function Action_CheckUniversity2AtBarmecia()
	local CheckUniversity = Logic.GetPlayerEntitiesInArea(gvMission_PlayerID, Entities.PB_University2, gvMission_CheckUniversityPosX, gvMission_CheckUniversityPosY, 1000, 1)
	if CheckUniversity == 1 then
		if gvMission_PlayerFindWeathermachine == 1 then
			GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest005_getOrb"))
		else
			GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest005_getOrb2"))
		end
		Logic.RemoveQuest(gvMission_PlayerID, 006) -- die nicht mehr ben�tigte Quest l�schen
		return 1
	end
end