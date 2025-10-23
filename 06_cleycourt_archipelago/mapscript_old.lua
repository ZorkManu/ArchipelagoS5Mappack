--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Author : 	Adam Sprys
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function GameCallback_OnGameStart() 

	--LuaDebugger.Break()
	
	--GUI.AddNote( "Text" )
	--GUI.AddNote(XGUIEng.GetStringTableText("CM01_00_Tutorial1_Txt/welcome"))
	--------------------------------------------------------------------------------
	-- Give money
	Logic.AddToPlayersGlobalResource(1,ResourceType.GoldRaw, 15000)
	Logic.AddToPlayersGlobalResource(1,ResourceType.SilverRaw, 5000)
	Logic.AddToPlayersGlobalResource(1,ResourceType.StoneRaw, 3000)
	Logic.AddToPlayersGlobalResource(1,ResourceType.IronRaw, 3000)
	--------------------------------------------------------------------------------
	-- Set mission trigger
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, NIL, "Mission_CheckEverySecond", 1)
	--------------------------------------------------------------------------------
	-- PLAYER NUMBER
	gvMission_PlayerID = GUI.GetPlayerID()
	gvMission_CleycourtID 	= 4
	gvMission_CleycourtAggressiveID = 6		
	gvMission_BarmeciaID 	= 3
	gvMission_Enemy1ID 	= 5
	gvMission_Enemy2ID 	= 7
	gvMission_assistingSoldiersID = 8
	
	-- Mission Globals
	gvMission_LostGame	 = 0
	
	gvMission_HeroDario		= Logic.GetEntityIDByName("Hero")
	
	gvMission_SupportBarmeciaTownAsk = 0
	gvMission_SupportBarmeciaTown	= 0
	gvMission_CleycourtTownWarning	= 0
	
	gvMission_Weathermachine 	= 0
	gvMission_WeathermachineAlive 	= Logic.GetEntityIDByName("Weathermachine")
	
	-- Ari Globals
	gvMission_HeroAri  		= Logic.GetEntityIDByName("Ari")
	gvMission_ArisItem 		= 0	
	gvMission_CheckAriBedWarning	= 0
	gvMission_CheckAriBedAttack	= 0
	gvMission_CheckAriBed 		= 0
	gvMission_AriLeader1Death	= Logic.GetEntityIDByName("AriLeader1")
	gvMission_AriLeader2Death	= Logic.GetEntityIDByName("AriLeader2")
	gvMission_AriLeader3Death	= Logic.GetEntityIDByName("AriLeader3")
	gvMission_AriLeadersDeath	= 0
	gvMission_AriNewTroop		= 0
	
	-- BarmeciaDefenceTroop
	gvMission_SpawnBarmeciaTroop1ID = 0
	gvMission_SpawnBarmeciaTroop2ID = 0
	gvMission_SpawnBarmeciaTroop3ID = 0
	-- CleycourtDefenceTroop
	gvMission_SpawnCleyPoleTroop1ID = 0
	gvMission_SpawnCleyPoleTroop2ID = 0
	gvMission_SpawnCleyBowTroop1ID = 0
	gvMission_SpawnCleyBowTroop2ID = 0
	
	--------------------------------------------------------------------------------
	-- Include global tool script functions
	Script.Load( "Data\\Script\\MapTools\\GlobalMissionScripts.lua" )		
	-- TIMER TOLL and initialize
	Script.Load( "Data\\Script\\MapTools\\TimerTool.lua" )
	TimerTool.Init()
	-- UNIT TO UNIT CHEKCK TOOL
	Script.Load( "Data\\Script\\MapTools\\UnitToUnitCheck.lua" )
	--------------------------------------------------------------------------------
	-- Create new timer
	TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_Movie_Start)	
	
	--TimerTool.Create(TimerTool.PeriodTimer, 30, Mission_WaitAndCheck_30)
	TimerTool.Create(TimerTool.PeriodTimer, 3, Mission_WaitAndCheck_3Sek)
	TimerTool.Create(TimerTool.PeriodTimer, 5, Mission_WaitAndCheck_5Sek)
	TimerTool.Create(TimerTool.PeriodTimer, 300, Mission_WaitAndCheck_5Min)
	TimerTool.Create(TimerTool.PeriodTimer, 420, Mission_WaitAndCheck_7Min)
	--------------------------------------------------------------------------------
	-- Init diplomacy
	-- PlayerID
	Logic.SetDiplomacyState( gvMission_PlayerID,	gvMission_CleycourtID,		Diplomacy.Friendly)
	Logic.SetDiplomacyState( gvMission_PlayerID,	gvMission_CleycourtAggressiveID,Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission_PlayerID,	gvMission_BarmeciaID,		Diplomacy.Friendly)
	Logic.SetDiplomacyState( gvMission_PlayerID,	gvMission_Enemy1ID,		Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission_PlayerID,	gvMission_Enemy2ID,		Diplomacy.Hostile )	
	Logic.SetDiplomacyState( gvMission_PlayerID,	gvMission_assistingSoldiersID,	Diplomacy.Friendly)
	-- CleycourtID
	Logic.SetDiplomacyState( gvMission_CleycourtID,			gvMission_BarmeciaID,	Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission_CleycourtAggressiveID,	gvMission_PlayerID,	Diplomacy.Hostile )		
	Logic.SetDiplomacyState( gvMission_CleycourtAggressiveID,	gvMission_BarmeciaID,	Diplomacy.Hostile )	
	-- BarmeciaID
	Logic.SetDiplomacyState( gvMission_BarmeciaID,	gvMission_CleycourtID,			Diplomacy.Hostile )
	Logic.SetDiplomacyState( gvMission_BarmeciaID,	gvMission_CleycourtAggressiveID,	Diplomacy.Hostile )	
	--------------------------------------------------------------------------------
	
	

	--------------------------------------------------------------------------------
	Mission_SetCameraStartPosition()
	--Mission_Attach_LeaderStartGroups()	
	-------------------------------------------------------------------------------
end

function Mission_SetCameraStartPosition()
	--Move Camera to starting point	
	local Start = Logic.GetEntityIDByName("StartPos")
	local X, Y, Z = Logic.EntityGetPos(Start)		
	Camera.ScrollGameTimeSynced(X,Y)
	
	--gvMission_MusicLength 	= 120
	Music.Start( "Data\\Sounds\\Music\\bards_tale.mp3", 50, 1 )
end
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_CheckEverySecond()
	TimerTool.Execute() -- wird für das TimerTool benötigt
	
	if gvMission_ArisItem == 1 then		
		Mission_ChangeAri()
		--give Player the Orb
	end	
		if gvMission_AriLeadersDeath == 0 then
			Mission_CheckAriLeaderDeath()
		end			
			if gvMission_CheckAriBedWarning == 0 then
				Mission_CheckAriBed_Warning()
			end
				if gvMission_CheckAriBedAttack == 0 then
					Mission_CheckAriAttack()
				end
					if gvMission_CheckAriBed == 0
					and gvMission_AriLeadersDeath == 1 then
						Mission_CheckAriBed()
					end
	Mission_LostCondition()	
	Mission_BarmeciaAliveTroops()
end
function Mission_WaitAndCheck_3Sek()
	if gvMission_SupportBarmeciaTownAsk == 0 then
		Mission_SupportBarmeciaTownAsk()
	end
	if gvMission_CleycourtTownWarning == 0 then 
		Mission_CleycourtCamp()	
	end
end
function Mission_WaitAndCheck_5Sek()
	if gvMission_Weathermachine == 0 then
		Mission_CheckWeathermachine()
	end
	
	if gvMission_SupportBarmeciaTown == 0 then
		Mission_SupportBarmeciaTown()
	end
	Mission_CleycourtAliveDefenceTroops()		
end
function Mission_WaitAndCheck_5Min()
	Mission_CheckVillagePosition()
	
	Mission_BarmeciaTroopsTakePosition()

	--if gvMission_SupportBarmeciaTown == 0 then
		-- nur Angreifen solange der Spieler Barmecia nicht unterstützt hat
	--	Mission_CleycourtAttackBarmeciaTroop1()
	--end

	Mission_CleycourtTroopsTakePosition()
end
function Mission_WaitAndCheck_7Min()
	if gvMission_SupportBarmeciaTown == 0 then
		-- nur Angreifen solange der Spieler Barmecia nicht unterstützt hat
		Mission_CleycourtAttackBarmeciaTroop1()
	end
end
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_StartQuest()
	-- Spielernummer, Quetstnummer, QuestType, QuestÜberschrieftID, QuestBezeichnungID
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest000_note_NewQuest"))	
	Logic.AddQuest(gvMission_PlayerID, 1, 1, "CM01_06_Cleycourt_Txt/mainquest_name", "CM01_06_Cleycourt_Txt/mainquest_desc")  
end
function Mission_Movie_Start()
	GUI.AddNote( "hier soll spaeter ein Scene hin, die einem erzaehlt was man machen muss" )
	TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_StartQuest)
end
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_CheckAriBed_Warning()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("Ari_Warning"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 1600, 1 )
	if checknum == 1 then
		gvMission_CheckAriBedWarning = 1
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest001_AriWarning"))
	end
end
-------------------------------------
function Mission_CheckAriAttack()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("AriAttack"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 1000, 1 )
	if checknum == 1 then
		gvMission_CheckAriBedAttack = 1
	--	local AriLeader1 = Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("AriLeader1"), gvMission_Enemy1ID)
	--	local AriLeader2 = Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("AriLeader2"), gvMission_Enemy1ID)
	--	local AriLeader3 = Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("AriLeader3"), gvMission_Enemy1ID)
	--	GlobalMissionScripting_AttachSoldiersToLeader(AriLeader1,6)
	--	GlobalMissionScripting_AttachSoldiersToLeader(AriLeader2,6)
	--	GlobalMissionScripting_AttachSoldiersToLeader(AriLeader3,6)
		Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
		GlobalMissionScripting_AttachSoldiersToLeader("AriLeader1",6)
		GlobalMissionScripting_AttachSoldiersToLeader("AriLeader2",6)
		GlobalMissionScripting_AttachSoldiersToLeader("AriLeader3",6)
	end
end
function Mission_CheckAriLeaderDeath()
	if GlobalMissionScripting.IsEntityAlive(gvMission_AriLeader1Death) == false
	or GlobalMissionScripting.IsEntityAlive(gvMission_AriLeader2Death) == false
	or GlobalMissionScripting.IsEntityAlive(gvMission_AriLeader3Death) == false then
		gvMission_AriLeadersDeath = 1
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest004_AriLost"))
		TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_AriNewLeader)
	end
end
function Mission_AriNewLeader()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriNewTroop"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderSword1" davon "5" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_AriNewTroop = GlobalMissionScripting.CreateGroup(gvMission_assistingSoldiersID, Entities.PU_LeaderSword1, 8, x, y, 270 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_AriNewTroop, 1 )
	--------------------------------------------------------------------------------
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriAttack"))
	Logic.MoveEntity(gvMission_AriNewTroop,X,Y)
end
-------------------------------------
function Mission_CheckAriBed()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("Ari_Bed"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 600, 1 )
	if checknum == 1 then
		gvMission_CheckAriBed = 1
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest002_AriBed"))		
		-- Player X, TributeID, 0 muß stehen, an Player X zahlen, Beschreibung, welche Resource, und wieviel davon 
		Logic.AddTribute(gvMission_PlayerID, 001, 0, gvMission_assistingSoldiersID, "CM01_06_Cleycourt_Txt/tribute_001_Ari", ResourceType.Silver, 1000 )
		-- NEW SUBQUEST
		Logic.AddQuest(gvMission_PlayerID, 2, 1, "CM01_06_Cleycourt_Txt/subquest003_name_Ari", "CM01_06_Cleycourt_Txt/subquest003_desc_Ari")		
	end
end
-------------------------------------
function Mission_ChangeAri()
	gvMission_ArisItem = 0
	TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_ChangeAritoPlayer)
end
function Mission_ChangeAritoPlayer()
	Logic.RemoveQuest(gvMission_PlayerID, 2) -- die nicht mehr benötigte Quest löschen
	--give Player the Orb
	--LuaDebugger.Break()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest005_getOrb"))
	gvMission_HeroAri = Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("Ari"), gvMission_PlayerID)
	Logic.ChangeEntityPlayerID(gvMission_AriNewTroop, gvMission_PlayerID)
end
-------------------------------------
function GameCallback_FulfillTribute(_PlayerID, _TributeID )
	-- Check Tributes
	if _TributeID == 001 then
		gvMission_ArisItem = 1
		return 1																					-- Delete Tribute
	end
	return 0 -- falls nicht vorhanden, muß sein, sonst gibs Fehler
end	
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_CheckWeathermachine()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("Machine"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 1000, 1 )
	if checknum == 1 then
		gvMission_Weathermachine = 1
		gvMission_WeathermachineAlive = Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("Weathermachine"), gvMission_PlayerID)
		Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("WeatherEnergy1"), gvMission_PlayerID)
		Logic.ChangeEntityPlayerID(Logic.GetEntityIDByName("WeatherEnergy2"), gvMission_PlayerID)
		TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_Movie_Weathermachine)
	end
end
function Mission_Movie_Weathermachine()
	GUI.AddNote( "hier soll spaeter ein Scene hin, die einem erzaehlt was ueber die Maschine erzaehlt" )
	GUI.AddNote( "Das muss die Maschine sein, von der in alten Geschichten erzaehlt wird. Mit ihr muesten wird schaffen den Streiten zwsichenden beiden Staedten zu beenden." )
	GUI.AddNote( "Wir könnten das unfruchtbare Land wieder acker fähig machen, das müste Cleycount zufrieden stellen" )
end
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_CheckVillagePosition()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BanditPatrol3"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 3800, 1 )
	if checknum == 1 then
		TimerTool.Create(TimerTool.OneWayTimer, 1, Mission_BanditTroop1)
		TimerTool.Create(TimerTool.OneWayTimer, 3, Mission_BanditTroop2)
		TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_BanditTroop3)
	end
end
function Mission_BanditTroop1()
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
function Mission_BanditTroop2()
	Mission_BanditTroop1()
end
function Mission_BanditTroop3()
	Mission_BanditTroop1()
end
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_CleycourtCamp()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("CleycourtCamp"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 2400, 1 )
	if checknum == 1 then
		gvMission_CleycourtTownWarning = 1
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest006_CleycourtTownWarning"))
	end
end

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
	TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_CleycourtAttackBarmeciaTroop2)
end

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
	TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_CleycourtAttackBarmeciaTroop3)
end

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

function Mission_CleycourtAliveDefenceTroops()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop1ID) == false then
		Mission_CleycourtPoleTroopDefencePoint1()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop2ID) == false then
		Mission_CleycourtPoleTroopDefencePoint2()
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop1ID) == false then
		Mission_CleycourtBowTroopDefencePoint1()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop2ID) == false then
		Mission_CleycourtBowTroopDefencePoint2()
	end		
end
function Mission_CleycourtTroopsTakePosition()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop1ID) == True then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint1"))
		Logic.MoveEntity(gvMission_SpawnCleyPoleTroop1ID,X,Y)
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop2ID) == True then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint2"))
		Logic.MoveEntity(gvMission_SpawnCleyPoleTroop2ID,X,Y)
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop1ID) == True then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint1"))
		Logic.MoveEntity(gvMission_SpawnCleyBowTroop1ID,X,Y)
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop2ID) == True then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint2"))
		Logic.MoveEntity(gvMission_SpawnCleyBowTroop2ID,X,Y)
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
	Logic.MoveEntity(gvMission_SpawnCleyPoleTroop1ID,X,Y)
end
function Mission_CleycourtPoleTroopDefencePoint2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm3" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyPoleTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderPoleArm3, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyPoleTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint2"))
	Logic.MoveEntity(gvMission_SpawnCleyPoleTroop2ID,X,Y)
end
function Mission_CleycourtBowTroopDefencePoint1()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop1ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop1ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint1"))
	Logic.MoveEntity(gvMission_SpawnCleyBowTroop1ID,X,Y)
end
function Mission_CleycourtBowTroopDefencePoint2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtAggressiveID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint2"))
	Logic.MoveEntity(gvMission_SpawnCleyBowTroop2ID,X,Y)
end
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_SupportBarmeciaTownAsk()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaTown"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 600, 1)
	if checknum == 1 then
		gvMission_SupportBarmeciaTownAsk = 1
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest009_BarmeciaAsk"))
		TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_SupportBarmeciaTownAskQuest)
	end
end
function Mission_SupportBarmeciaTownAskQuest()
	--GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest000_note_NewQuest"))	
	-- NEW SUBQUEST
	Logic.AddQuest(gvMission_PlayerID, 3, 1, "CM01_06_Cleycourt_Txt/subquest_010_name_SupportBarmeciaTown", "CM01_06_Cleycourt_Txt/subquest_010_desc_SupportBarmeciaTown")  
end


function Mission_SupportBarmeciaTown()
	local X, Y 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaTown"))
	--PlayerID, 0 für prüfe alle Einheitentypen, ab Pos X, Y, in Umkreis, wieviele Einheiten es betreten müßen
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID,0, X,Y, 600, 26)--39 )
	if checknum == 26 then
		gvMission_SupportBarmeciaTown = 1
		Logic.RemoveQuest(gvMission_PlayerID, 3) -- die nicht mehr benötigte Quest löschen
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest007_SupportBarmeciaTown"))
		TimerTool.Create(TimerTool.OneWayTimer, 5, Mission_BarmeciaGiveConstructionPlan)
	end
end
function Mission_BarmeciaGiveConstructionPlan()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/subquest008_Barmecia_give_constructionplan"))
end

function Mission_BarmeciaAliveTroops()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop1ID) == false then
		Mission_BarmeciaDefenceTroop1()
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop2ID) == false then
		Mission_BarmeciaDefenceTroop2()
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop3ID) == false then
		Mission_BarmeciaDefenceTroop3()
	end	
end

function Mission_BarmeciaTroopsTakePosition()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop1ID) == True then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint1"))
		Logic.MoveEntity(gvMission_SpawnBarmeciaTroop1ID,X,Y)
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop2ID) == True then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint2"))
		Logic.MoveEntity(gvMission_SpawnBarmeciaTroop2ID,X,Y)
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnBarmeciaTroop3ID) == True then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint3"))
		Logic.MoveEntity(gvMission_SpawnBarmeciaTroop3ID,X,Y)
	end	
end

function Mission_BarmeciaDefenceTroop1()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderSword2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroop1ID = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderSword2, 6, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroop1ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint1"))
	Logic.MoveEntity(gvMission_SpawnBarmeciaTroop1ID,X,Y)
end
function Mission_BarmeciaDefenceTroop2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderPoleArm2, 6, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint2"))
	Logic.MoveEntity(gvMission_SpawnBarmeciaTroop2ID,X,Y)
end
function Mission_BarmeciaDefenceTroop3()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderSword2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnBarmeciaTroop3ID = GlobalMissionScripting.CreateGroup(gvMission_BarmeciaID, Entities.PU_LeaderSword2, 6, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnBarmeciaTroop3ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("DefencePoint3"))
	Logic.MoveEntity(gvMission_SpawnBarmeciaTroop3ID,X,Y)
end
------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
function Mission_LostCondition()
	if gvMission_LostGame == 1 then
		return
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_WeathermachineAlive) == false
		or GlobalMissionScripting.IsEntityAlive(gvMission_HeroDario) == false
		or GlobalMissionScripting.IsEntityAlive(gvMission_HeroAri) == false then
			GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/Text002_LostGame"))			
			gvMission_LostGame = 1
	end
end