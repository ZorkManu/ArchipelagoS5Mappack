--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitCleycourtFunctions()
	-- Cleycourt Globals
	gvMission_CleycourtCheck1 	= Logic.GetEntityIDByName("CleycourtCamp1")
	gvMission_CleycourtCheck2 	= Logic.GetEntityIDByName("CleycourtCamp2")
	--gvMission_FindCleycourt		= 0
	-- CleycourtDefenceTroop
	gvMission_SpawnCleyPoleTroop1ID = 0
	gvMission_SpawnCleyPoleTroop2ID = 0
	gvMission_SpawnCleyPoleTroop3ID = 0
	gvMission_SpawnCleyBowTroop1ID = 0
	gvMission_SpawnCleyBowTroop2ID = 0
	gvMission_SpawnCleyBowTroop3ID = 0
	gvMission_SpawnCleyBowTroop4ID = 0
	
	
	--gvMission_CleycourtTownWarning	= 0
	--------------------------------------------------------------------------------
	-- active Cleycourt DefenceTroops
	Mission_CleycourtPoleTroopDefencePoint1()
	Mission_CleycourtPoleTroopDefencePoint2()
	Mission_CleycourtPoleTroopDefencePoint3()	
	Mission_CleycourtBowTroopDefencePoint1()
	Mission_CleycourtBowTroopDefencePoint2()
	Mission_CleycourtBowTroopDefencePoint3()
	Mission_CleycourtBowTroopDefencePoint4()	
	--------------------------------------------------------------------------------
	
	GlobalMissionScripting.RequestTrigger( "CleycourtTroopsTakePosition" )
	GlobalMissionScripting.RequestTrigger( "CleycourtAttackBarmecia" )
	GlobalMissionScripting.RequestTrigger( "FindCleycourt" )
	
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_FindCleycourt()
	return Counter.Tick2("FindCleycourt", 2) -- 2 second
end
function Action_FindCleycourt()
	local X, Y 	= Logic.GetEntityPosition(gvMission_CleycourtCheck1)
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum1 = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1000, 1 )
	
	local X, Y 	= Logic.GetEntityPosition(gvMission_CleycourtCheck2)
	local checknum2 = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 1000, 1 )
	
	if checknum1 ~= 0
	or checknum2 ~= 0 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest003_CleycourtGreeting"))
		GlobalMissionScripting.RequestTrigger( "FindCleycourtMayor" )		
		
		-- Make on screen information
		Logic.SetOnScreenInformation(Logic.GetEntityIDByName("CleycourtMayor"), 1)

		return 1
	end
end
----------------------------------------------------------------------------------------------
function Condition_FindCleycourtMayor()
	return Counter.Tick2("FindCleycourtMayor", 3) -- 3 second
end
function Action_FindCleycourtMayor()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("CleycourtMayor"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 800, 1 )
	if checknum == 1 then
		Logic.SetOnScreenInformation(Logic.GetEntityIDByName("CleycourtMayor"), 0)		
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest003_CleycourtMayorSpeaks1"))
		GlobalMissionScripting.RequestTrigger( "CleycourtMayorSpeaks1" )
		GlobalMissionScripting.RequestTrigger( "CleycourtMayorSpeaks2" )
		
		--gvMission_FindCleycourt = 1		
		Logic.RemoveQuest(gvMission_PlayerID, 001) -- die nicht mehr benötigte Quest löschen
		return 1
	end
end
function Condition_CleycourtMayorSpeaks1()
	return Counter.Tick2("CleycourtMayorSpeaks1", 9) -- 5 second
end
function Action_CleycourtMayorSpeaks1()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest003_CleycourtMayorSpeaks2"))
	return 1
end
function Condition_CleycourtMayorSpeaks2()
	return Counter.Tick2("CleycourtMayorSpeaks2", 18) -- 10 second
end
function Action_CleycourtMayorSpeaks2()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest003_CleycourtMayorSpeaks3"))	
	
	if gvMission_FindBarmecia == 0 then
		Logic.AddQuest(gvMission_PlayerID, 007, 1, "CM01_06_Cleycourt_Txt/subquest009_name_FindBarmecia", "CM01_06_Cleycourt_Txt/subquest009_desc_FindBarmecia")
		GlobalMissionScripting.RequestTrigger( "NewQuest" )
	end
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_CleycourtAliveDefenceTroops()
	return 1 -- damit die Action_ClaycourtAliveTroops jedesmal aufgerufen wird
end
function Action_CleycourtAliveDefenceTroops()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop1ID) == false then
		Mission_CleycourtPoleTroopDefencePoint1()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop2ID) == false then
		Mission_CleycourtPoleTroopDefencePoint2()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop3ID) == false then
		Mission_CleycourtPoleTroopDefencePoint3()
	end	
	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop1ID) == false then
		Mission_CleycourtBowTroopDefencePoint1()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop2ID) == false then
		Mission_CleycourtBowTroopDefencePoint2()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop3ID) == false then
		Mission_CleycourtBowTroopDefencePoint3()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop4ID) == false then
		Mission_CleycourtBowTroopDefencePoint4()
	end			
end
function Mission_CleycourtPoleTroopDefencePoint1()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm3" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyPoleTroop1ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderPoleArm3, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyPoleTroop1ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint1"))
	Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop1ID, X,Y, -1)
end
function Mission_CleycourtPoleTroopDefencePoint2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm3" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyPoleTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderPoleArm3, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyPoleTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint2"))
	Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop2ID, X,Y, -1)
end
function Mission_CleycourtPoleTroopDefencePoint3()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm3" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyPoleTroop3ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderPoleArm3, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyPoleTroop3ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint3"))
	Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop3ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint1()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop1ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop1ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint1"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop1ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint2"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop2ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint3()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop3ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop3ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint3"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop3ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint4()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop4ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop4ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint4"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop4ID, X,Y, -1)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_CleycourtTroopsTakePosition()
	return Counter.Tick2("CleycourtTroopsTakePosition", 31) -- 31 second
end
function Action_CleycourtTroopsTakePosition()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop1ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint1"))
		Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop1ID, X,Y, -1)		
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop2ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint2"))
		Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop2ID, X,Y, -1)		
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop3ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint3"))
		Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop3ID, X,Y, -1)		
	end
		
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop1ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint1"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop1ID, X,Y, -1)		
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop2ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint2"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop2ID, X,Y, -1)		
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop3ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint3"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop3ID, X,Y, -1)		
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop4ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint4"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop4ID, X,Y, -1)		
	end		
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_CleycourtAttackBarmecia()
	return Counter.Tick2("CleycourtAttackBarmecia", 420) -- 7 minutes
end
function Action_CleycourtAttackBarmecia()
	-- nur Angreifen solange der Spieler Barmecia nicht unterstützt hat
	if gvMission_SupportBarmeciaTown == 0 then
	
		Mission_CleycourtAttackBarmeciaTroop1()
	
		GlobalMissionScripting.RequestTrigger( "CleycourtAttackBarmeciaTroop2" )
		GlobalMissionScripting.RequestTrigger( "CleycourtAttackBarmeciaTroop3" )
	end
end
function Condition_CleycourtAttackBarmeciaTroop2()
	return Counter.Tick2("CleycourtAttackBarmeciaTroop2", 3) -- 3 second
end
function Action_CleycourtAttackBarmeciaTroop2()
	Mission_CleycourtAttackBarmeciaTroop2()
	return 1
end
function Condition_CleycourtAttackBarmeciaTroop3()
	return Counter.Tick2("CleycourtAttackBarmeciaTroop3", 5) -- 5 second
end
function Action_CleycourtAttackBarmeciaTroop3()
	Mission_CleycourtAttackBarmeciaTroop3()
	return 1
end
-------------------------------------
function Mission_CleycourtAttackBarmeciaTroop1()	
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderSword1" davon "12" Stück, auf die Postion "X Y Blickrichtung"	
	local SpawnCleyTroopID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderSword1, 12, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( SpawnCleyTroopID, 1 )
	-- Set range where they attack enemies
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyWay1"))
	-- Banditen angreifen lassen
	Logic.GroupPatrol(SpawnCleyTroopID, X, Y)
	Logic.GroupAddPatrolPoint(SpawnCleyTroopID, Logic.GetEntityPosition (Logic.GetEntityIDByName("CleyWay2")))
	Logic.GroupAddPatrolPoint(SpawnCleyTroopID, Logic.GetEntityPosition (Logic.GetEntityIDByName("CleyWay3")))
end
-------------------------------------
function Mission_CleycourtAttackBarmeciaTroop2()	
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm1" davon "12" Stück, auf die Postion "X Y Blickrichtung"	
	local SpawnCleyTroopID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderPoleArm1, 12, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( SpawnCleyTroopID, 1 )
	-- Set range where they attack enemies
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyWay1"))
	-- Banditen angreifen lassen
	Logic.GroupPatrol(SpawnCleyTroopID, X, Y)
	Logic.GroupAddPatrolPoint(SpawnCleyTroopID, Logic.GetEntityPosition (Logic.GetEntityIDByName("CleyWay2")))
	Logic.GroupAddPatrolPoint(SpawnCleyTroopID, Logic.GetEntityPosition (Logic.GetEntityIDByName("CleyWay3")))	
end
-------------------------------------
function Mission_CleycourtAttackBarmeciaTroop3()	
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderSword1" davon "12" Stück, auf die Postion "X Y Blickrichtung"	
	local SpawnCleyTroopID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderSword1, 12, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( SpawnCleyTroopID, 1 )
	-- Set range where they attack enemies
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyWay1"))
	-- Banditen angreifen lassen
	Logic.GroupPatrol(SpawnCleyTroopID, X, Y)
	Logic.GroupAddPatrolPoint(SpawnCleyTroopID, Logic.GetEntityPosition (Logic.GetEntityIDByName("CleyWay2")))
	Logic.GroupAddPatrolPoint(SpawnCleyTroopID, Logic.GetEntityPosition (Logic.GetEntityIDByName("CleyWay3")))
end