--------------------------------------------------------------------------------
-- MapName: Wasteland
--
-- Author: Peter Sprys
--
--------------------------------------------------------------------------------

-- Include main function
Script.Load( Folders.MapTools.."Main.lua" )
Script.Load("maps\\user\\ArchipelagoScript\\archipelago_jobs.lua")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
	
	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,2)
	Display.SetPlayerColorMapping(3,6)
	Display.SetPlayerColorMapping(5,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(6,4)
	Display.SetPlayerColorMapping(8,NPC_COLOR)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	-- Generate resources
	Tools.GiveResouces(gvMission.PlayerID, 300, 800, 800, 400,200)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	-- forbid weather machine base
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_ChangeWeather, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_WeatherForecast, 0)

	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_MarketSulfur, 0)
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.T_MarketIron, 0)
	
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
	
	WeatherSets_SetupHighland(1)
	WeatherSets_SetupHighlandRain(2)
	WeatherSets_SetupHighlandSnow(3)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()

	String.Init("CM01_17_CloudyMountains_Txt")

	-- Load mission files
	IncludeLocals("gameControl")
	IncludeLocals("Map_LocalInit")

	IncludeLocals("army_ai1attack")
	IncludeLocals("army_ai1defendiron")
	IncludeLocals("army_ai1Defense")
	IncludeLocals("army_ai2concentratingarea")
	IncludeLocals("army_robbers")

	IncludeLocals("briefing_key")
	IncludeLocals("briefing_orb")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_stonevalley")
	IncludeLocals("briefing_svmajor")
	IncludeLocals("briefing_snow")
	IncludeLocals("briefing_gate")
	IncludeLocals("briefing_IronMan")
	IncludeLocals("briefing_woodpecker")
	
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_5")
	IncludeLocals("player_6")

	IncludeLocals("quest_buildup")
	IncludeLocals("quest_buyorb")
	IncludeLocals("quest_defeat")
	IncludeLocals("quest_destroyblocking")
	IncludeLocals("quest_destroystone")
	IncludeLocals("quest_findorb")
	IncludeLocals("quest_snow")
	IncludeLocals("quest_gateHQ")
	IncludeLocals("quest_stonevalley")
	IncludeLocals("quest_CountVCs")
	IncludeLocals("quest_IronManTribute")
	
	IncludeLocals("Cutscene_Control")

	String.Init("CM01_17_CloudyMountains_Txt")

	--	chest handling
	archipelago_init()
	HeroSpawn()
	enableTechsOutOfGDB()

	setEnemyAis({
		2,
		5
	})

	if IsDead("Pilgrim") and GDB.GetString("pilgrim") == "1" then
		CreateMilitaryGroup(1, Entities.PU_Hero2, 0, GetPosition("HeroSpawn"), "Pilgrim")
		CreateChestOpener("Pilgrim")
		HEROCOUNT = 4
	end

	local enemyUpgrades = 0

	local diff =  getArchipelagoDifficultyMultiplier()

	if diff > 2 then
		enemyUpgrades = 1
		if diff >= 4 then
			enemyUpgrades = 2
		end
	end

	if enemyUpgrades > 0 then
		for i = 1, enemyUpgrades do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
		end
	end
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()
		
	-- Start time line
--	TimeLine.Start()

	MapLocal_CreateNPCs()

	StartSimpleJob("isDeadBanditBase")
	StartSimpleJob("isDeadBanditStoneVille")
	StartSimpleJob("isDeadMordred")
	

	-- Start prelude
	local pos = GetPosition(getLeadingHero())
	Camera.ScrollSetLookAt(pos.X, pos.Y)
	
	LocalMusic.UseSet = EUROPEMUSIC
	
	start1stQuest()
	
--	EnableDebugging()
end

function isDeadBanditBase()
	if GlobalMissionScripting.IsEntityDestroyed("RobberTower1") then
		checkLocation("cloudy_mountains_bandits")
		return true
	end
end

function isDeadBanditStoneVille()
	if GlobalMissionScripting.IsEntityDestroyed("RobberTower4") then
		checkLocation("cloudy_mountains_bandits_stoneville")
		return true
	end
end

function isDeadMordred()
	if GlobalMissionScripting.IsEntityDestroyed("HQ_AI1") then
		checkLocation("cloudy_mountains_mordred_base")
		return true
	end
end

