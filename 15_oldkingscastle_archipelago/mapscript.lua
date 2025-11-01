--------------------------------------------------------------------------------
-- MapName: Old Kings Castle
--
-- Author: Peter Sprys
--
--------------------------------------------------------------------------------

	Input.KeyBindDown (Keys.NumPad7, "Cheat_Intro_Start()")


-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
Script.Load("maps\\user\\ArchipelagoScript\\archipelago_jobs.lua")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

	Display.SetPlayerColorMapping(2, KERBEROS_COLOR)		-- Kerberos in Southwest
	Display.SetPlayerColorMapping(3, ROBBERS_COLOR)			-- Robbers at Mountain path
	Display.SetPlayerColorMapping(4, 9)	-- Garek, village
	Display.SetPlayerColorMapping(5, KERBEROS_COLOR)		-- Kerberos in northeast
	Display.SetPlayerColorMapping(6, 15)		-- Avala (Mountain village)
	Display.SetPlayerColorMapping(7, NPC_COLOR)				-- NPCs
	
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	Display.SetRenderUseGfxSets(1)
	
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.AddWeatherElement(2, 5, 1, 2, 5, 10)

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	AriFriendsTalkCount = 0

	IncludeLocals("Cutscene_Control")

	-- Load mission files
	IncludeLocals("army_p2defense")
	IncludeLocals("army_p2firstattack")
	IncludeLocals("army_p2intruders")
	IncludeLocals("army_p2ironattack")
	IncludeLocals("army_p2villageattack")
	IncludeLocals("army_p3robbers")
	IncludeLocals("army_p5attack")
	IncludeLocals("army_p5defense")
	IncludeLocals("army_p6attack")

	IncludeLocals("briefing_bergstadt")
	IncludeLocals("briefing_bergstadtattack")
	IncludeLocals("briefing_garek")
	IncludeLocals("briefing_kerberos")
	IncludeLocals("briefing_neutralkerberos")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_sommer")
	IncludeLocals("briefing_closedgate")
	IncludeLocals("briefing_arisfriends")
	IncludeLocals("briefing_ariheliasdead")
	
	IncludeLocals("gameControl")

	IncludeLocals("player_1")
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_5")
	IncludeLocals("player_6")

	IncludeLocals("quest_arifriends")
	IncludeLocals("quest_buildneariron")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_defeatkerberos")
	IncludeLocals("quest_reachexit")
	IncludeLocals("quest_rescuevillage")
	IncludeLocals("quest_sommer")
	IncludeLocals("quest_tributebergstadt")
	IncludeLocals("quest_wintergate")
	IncludeLocals("quest_ariheliasdead")

	IncludeLocals("quest_gatekey")
	IncludeLocals("quest_opengate")
	IncludeLocals("quest_closedgate")
	IncludeLocals("quest_Leonardo")
	IncludeLocals("quest_rewards")
	IncludeLocals("quest_rebuildCastle")
	
	IncludeLocals("Map_LocalInit")		--TF_Include!

	--	chest handling
	archipelago_init()
	enableTechsOutOfGDB()
	HeroSpawn("2")

	if IsDead("Pilgrim") then
		if GDB.GetString("pilgrim") == "1" then
			CreateMilitaryGroup(1, Entities.PU_Hero2, 0, GetPosition("HeroSpawn"), "Pilgrim")
			CreateChestOpener("Pilgrim")
			HEROCOUNT = HEROCOUNT -1
		end
	end
	if IsDead("Helias") then
		if GDB.GetString("helias") == "1" then
			CreateMilitaryGroup(1, Entities.PU_Hero6, 0, GetPosition("HeroSpawn2"), "Helias")
			CreateChestOpener("Helias")
			HEROCOUNT = HEROCOUNT -1
		end
	end
	if IsDead("Ari") then
		if GDB.GetString("ari") == "1" then
			CreateMilitaryGroup(1, Entities.PU_Hero5, 0, GetPosition("HeroSpawn2"), "Ari")
			CreateChestOpener("Ari")
			HEROCOUNT = HEROCOUNT -1
		end
	end

	AriFriendsTalkCount = 0

	ChangePlayer("HQ",1)
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()

	StartSimpleJob("isDeadWinterBase")

	local enemyUpgrades = 0

	local diff = getArchipelagoDifficultyMultiplier()

	if diff > 3 then
		enemyUpgrades = 1
		if diff > 4 then
			enemyUpgrades = 2
		end
	end

	if enemyUpgrades > 0 then
		for i = 1, enemyUpgrades do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		end
	end


	--
	
		String.Init("CM01_15_OldKingsCastle_Txt")

	-- Set Music-Set

		LocalMusic.UseSet = MEDITERANEANMUSIC

	-- Start time line

		TimeLine.Start()
	
	-- Start prelude

		StartCutscene("Intro", start1stQuest)


-- DEBUGG

--	EnableDebugging()

--	StartCutscene("MissionComplete")
end

function isDeadWinterBase()
	if GlobalMissionScripting.IsEntityDestroyed("HQ_AI1") then
		checkLocation("old_kings_castle_winter_base")
		return true
	end
end
