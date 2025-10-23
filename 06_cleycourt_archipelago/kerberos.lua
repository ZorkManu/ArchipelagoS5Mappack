--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitKerberosFunctions()
	-- Ari Globals
	gvMission_VillainHero  		= Logic.GetEntityIDByName("VillainHero")
	gvMission_VillainLeader1	= Logic.GetEntityIDByName("VillainLeader1")
	gvMission_VillainLeader2	= Logic.GetEntityIDByName("VillainLeader2")
	gvMission_VillainRetreat	= Logic.GetEntityIDByName("Retreat")
	gvMission_VillainAbsconding	= 0	
	
	gvMission_VillainSerf1	= 0
	gvMission_VillainSerf2	= 0
	gvMission_VillainSerf3	= 0
	gvMission_VillainSerf4	= 0
	
	gvMission_VillainTroop1	= 0
	gvMission_VillainTroop2	= 0
	gvMission_VillainTroop3	= 0
	gvMission_VillainTroop4	= 0
	gvMission_VillainTroopCount	= 0

	gvMission_KeyChestPosX, gvMission_KeyChestPosY 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("KeyChest"))
	
	---------------------------------------------------------------
	GlobalMissionScripting.RequestTrigger( "findKerberosCamp" )
	GlobalMissionScripting.RequestTrigger( "ForestmanTip" )
	
	GlobalMissionScripting.RequestTrigger( "UpdateKerberosVillageCentert" )
	GlobalMissionScripting.RequestTrigger( "AliveKerberosTroops" )
	
	
	---------------------------------------------------------------
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf1) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainSerf1 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf2) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainSerf2 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf3) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainSerf3 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf4) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainSerf4 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
	end
	---------------------------------------------------------------
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop1) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainTroop1 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderSword1, 8, X, Y, 10 )
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop2) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainTroop2 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderSword2, 8, X, Y, 10 )
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop3) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainTroop3 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderBow1, 8, X, Y, 10 )
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop4) == false then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
		gvMission_VillainTroop4 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderPoleArm2, 8, X, Y, 10 )
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_findKerberosCamp()
	return Counter.Tick2("Condition_findKerberosCamp", 3) -- 3 second
end
function Action_findKerberosCamp()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("findKerberosCamp"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, X,Y, 850, 1 )
	if checknum == 1 then
		GlobalMissionScripting_AttachSoldiersToLeader("VillainHero"	,8)
		GlobalMissionScripting_AttachSoldiersToLeader("VillainLeader1"	,8)
		GlobalMissionScripting_AttachSoldiersToLeader("VillainLeader2"	,6)		
		
		local x, y = Logic.EntityGetPos(gvMission_VillainHero)
		Logic.GroupDefend(gvMission_VillainHero)
		Logic.LeaderSetTerritory(gvMission_VillainHero, x, y, 2700)	-- verteidige den Bereich
	
		local x, y = Logic.EntityGetPos(gvMission_VillainLeader1)
		Logic.GroupDefend(gvMission_VillainLeader1)
		Logic.LeaderSetTerritory(gvMission_VillainLeader1, x, y, 2500)	-- verteidige den Bereich
	
		local x, y = Logic.EntityGetPos(gvMission_VillainLeader2)
		Logic.GroupDefend(gvMission_VillainLeader2)
		Logic.LeaderSetTerritory(gvMission_VillainLeader2, x, y, 2500)	-- verteidige den Bereich
		
		Logic.SetDiplomacyState( gvMission_Enemy1ID, gvMission_PlayerID, Diplomacy.Hostile )
		
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest010_Kerberos_attack"))
		
		GlobalMissionScripting.RequestTrigger( "CheckIVillainHeroHitPoints" )
		GlobalMissionScripting.RequestTrigger( "KeyChest" )
		return 1
	end
end
function Condition_CheckIVillainHeroHitPoints()
	return Counter.Tick2("CheckIVillainHeroHitPoints", 3) -- 3 second
end
function Action_CheckIVillainHeroHitPoints()
	--local VillainHeroHealth = Logic.GetEntityHealth(gvMission_VillainHero)
	local VillainHeroHealth = Logic.LeaderGetNumberOfSoldiers(gvMission_VillainHero)
	if VillainHeroHealth < 4 then
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest010_Kerberos_flee"))
		
		local X, Y = Logic.GetEntityPosition(gvMission_VillainRetreat)
		if GlobalMissionScripting.IsEntityAlive(gvMission_VillainHero) == true then			
			Logic.MoveSettler(gvMission_VillainHero, X, Y, -1)
		end
		if GlobalMissionScripting.IsEntityAlive(gvMission_VillainLeader1) == true then			
			Logic.MoveSettler(gvMission_VillainLeader1, X, Y, -1)
		end
		if GlobalMissionScripting.IsEntityAlive(gvMission_VillainLeader2) == true then			
			Logic.MoveSettler(gvMission_VillainLeader2, X, Y, -1)
		end
					
		GlobalMissionScripting.RequestTrigger( "VillainHeroFlee" )
		--GlobalMissionScripting.RequestTrigger( "CheckIronMInePosition" )
		GlobalMissionScripting.RequestTrigger( "Forestman" )
		return 1
	end	
end
function Condition_VillainHeroFlee()
	return 1
end
function Action_VillainHeroFlee()
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainHero) == true then			
		if Logic.CheckEntitiesDistance(gvMission_VillainRetreat, gvMission_VillainHero, 150) == 1 then			
			Logic.DestroyGroupByLeader(gvMission_VillainHero)			
		end
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainLeader1) == true then			
		if Logic.CheckEntitiesDistance(gvMission_VillainRetreat, gvMission_VillainLeader1, 150) == 1 then
			Logic.DestroyGroupByLeader(gvMission_VillainLeader1)
		end
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainLeader2) == true then			
		if Logic.CheckEntitiesDistance(gvMission_VillainRetreat, gvMission_VillainLeader2, 150) == 1 then
			Logic.DestroyGroupByLeader(gvMission_VillainLeader2)
		end
	end
	
	if GlobalMissionScripting.IsEntityAlive(gvMission_VillainHero) == false
	and GlobalMissionScripting.IsEntityAlive(gvMission_VillainLeader1) == false
	and GlobalMissionScripting.IsEntityAlive(gvMission_VillainLeader2) == false then
		return 1
	end
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_CheckIronMInePosition()
	return Counter.Tick2("CheckIronMInePosition", 290) -- 4.8 minutes
end
function Action_CheckIronMInePosition()
	if gvMission_BanditAttacktedVillage < 2 then
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPatrol3"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 3800, 1 )
	if checknum == 1 then
		Mission_BanditTroop()	
		GlobalMissionScripting.RequestTrigger( "BanditTroop2" )	
		GlobalMissionScripting.RequestTrigger( "BanditTroop3" )
				
		gvMission_BanditAttacktedVillage = 1 -- zeigt an daß die Banditen angegriffen haben
		--return 1 -- darf nicht gesetzt werden, da diese Funktion immer alle paar Minuten aufgerufen werden muß
	end
	end
end
function Condition_BanditTroop2()
	return Counter.Tick2("BanditTroop2", 3) -- 3 second
end
function  Action_BanditTroop2()
	Mission_BanditTroop()
	return 1
end
function Condition_BanditTroop3()
	return Counter.Tick2("BanditTroop3", 5) -- 5 second
end
function  Action_BanditTroop3()
	Mission_BanditTroop()
	return 1
end
function Mission_BanditTroop()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderSword1" davon "5" Stück, auf die Postion "X Y Blickrichtung"	
	local SpawnBanditID = GlobalMissionScripting.CreateGroup(gvMission_Enemy1ID, Entities.PU_LeaderSword1, 8, x, y, 180 )
	-- Formation ändern
	Logic.LeaderChangeFormationType( SpawnBanditID, 1 )
	--------------------------------------------------------------------------------
	-- Set range where they attack enemies
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPatrol1"))
	-- Banditen angreifen lassen
	Logic.GroupPatrol(SpawnBanditID, X, Y)
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("BanditPatrol2")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("BanditPatrol3")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("BanditPatrol4")))
	Logic.GroupAddPatrolPoint(SpawnBanditID, Logic.GetEntityPosition (Logic.GetEntityIDByName("BanditPatrol5")))	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_ForestmanTip()
	if gvMission_BanditAttacktedVillage == 0 then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("forestman"))
		--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
		local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 600, 1 )
		if checknum == 1 then
			return 1
		end	
	end	
end
function Action_ForestmanTip()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest010_ForestManTip"))	
	return 1
end

function Condition_Forestman()
	if gvMission_BanditAttacktedVillage == 1 then
		local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("forestman"))
		--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
		local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 600, 1 )
		if checknum == 1 then
			return 1
		end	
	end	
end
function Action_Forestman()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest010_ForestMan"))	
	Logic.AddQuest(gvMission_PlayerID, 008, 1, "CM01_06_Cleycourt_Txt/subquest010_name_ForestManTip", "CM01_06_Cleycourt_Txt/subquest010_desc_ForestManTip")  
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	-- Player X, TributeID, 0 muß stehen, an Player X zahlen, Beschreibung, welche Resource, und wieviel davon 
	Logic.AddTribute(gvMission_PlayerID, 001, 0, gvMission_assistingSoldiersID, "CM01_06_Cleycourt_Txt/tribute_002_forestman", ResourceType.Gold, 1000, ResourceType.Stone, 500)
	return 1
end

function Condition_ForestmanHelp()
	if gvMission_BanditAttacktedVillage == 2 then
		return 1
	end
end
function Action_ForestmanHelp()
	Logic.RemoveQuest(gvMission_PlayerID, 008) -- die nicht mehr benötigte Quest löschen
	
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
	--Logic.CreateEntity( Entities.PU_Serf, x, y, 180, PlayerID)
	-- eine Steinblockande erstellen
	Logic.CreateEntity(Entities.XD_Rock7, X,Y, 0, 0)
	Logic.CreateEntity(Entities.XD_Rock7, X+200,Y+100, 90, 0)
	Logic.CreateEntity(Entities.XD_Rock6, X-50,Y+300, 0, 0)
	Logic.CreateEntity(Entities.XD_Rock5, X,Y+400, 0, 0)	
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_KeyChest()
	return Counter.Tick2("KeyChest", 2) -- 2 second
end
function Action_KeyChest()		
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, gvMission_KeyChestPosX,gvMission_KeyChestPosY, 400, 1 )
	if checknum == 1 then
		gvMission_FindKeyChest = 1
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("KeyChest"))
		Logic.DestroyEntity(Logic.GetEntityIDByName("KeyChest"))
		Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 292, 0)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest010_Kerberos_FindKeyChest"))
		return 1
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_UpdateKerberosVillageCentert()
	return Counter.Tick2("UpdateKerberosVillageCentert", 420) -- 7 minutes
end
function Action_UpdateKerberosVillageCentert()
	if gvMission_BanditAttacktedVillage < 2 then -- wurde der Hölleneingang noch nicht blockiert
		if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf1) == false then
			local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
			gvMission_VillainSerf1 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
		end
		if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf2) == false then
			local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
			gvMission_VillainSerf2 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
		end
		if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf3) == false then
			local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
			gvMission_VillainSerf3 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
		end
		if GlobalMissionScripting.IsEntityAlive(gvMission_VillainSerf4) == false then
			local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
			gvMission_VillainSerf4 = Logic.CreateEntity(Entities.PU_Serf, X,Y, 10, gvMission_Enemy2ID)
		end
	else
		return 1
	end		
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_AliveKerberosTroops()
	return Counter.Tick2("AliveKerberosTroops",420) -- 7 Minutes
end
function Action_AliveKerberosTroops()
	if gvMission_BanditAttacktedVillage < 2 then -- wurde der Hölleneingang noch nicht blockiert	
		gvMission_VillainTroopCount = gvMission_VillainTroopCount + 1	
	
		if gvMission_VillainTroopCount == 1 then
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop1) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop1 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderSword1, 8, X, Y, 10 )
			end
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop2) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop2 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderSword2, 8, X, Y, 10 )
			end
		end
		
		if gvMission_VillainTroopCount == 2 then
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop1) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop1 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderSword1, 8, X, Y, 10 )
			end
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop3) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop3 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderBow1, 8, X, Y, 10 )
			end			
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop4) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop4 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderPoleArm2, 8, X, Y, 10 )
			end
		end
		
		if gvMission_VillainTroopCount == 3 then
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop1) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop1 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderSword1, 8, X, Y, 10 )
			end
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop2) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop2 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderSword2, 8, X, Y, 10 )
			end
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop3) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop3 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderBow1, 8, X, Y, 10 )
			end
			if GlobalMissionScripting.IsEntityAlive(gvMission_VillainTroop4) == false then
				local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPortal"))
				gvMission_VillainTroop4 = GlobalMissionScripting.CreateGroup(gvMission_Enemy2ID, Entities.PU_LeaderPoleArm2, 8, X, Y, 10 )
			end
		end
		
		-- wieder beim ersten Leader prüfen
		if gvMission_VillainTroopCount == 3 then
			gvMission_VillainTroopCount = 0
		end
	else
		return 1
	end
end