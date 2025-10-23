--------------------------------------------------------------------------------
-- MapName: 	CM_04_Crawford
--
-- Author: 		Andreas Nitsche; Thomas Friedmann
--
--------------------------------------------------------------------------------
-->TF
	Input.KeyBindDown (Keys.NumPad4, "Cheat_Cutscene1_Start()")
	Input.KeyBindDown (Keys.NumPad1, "Cheat_CutsceneComplete_Start()")
	Input.KeyBindDown (Keys.NumPad7, "Cheat_Intro_Start()")

	Input.KeyBindDown (Keys.NumPad9, "EnableDebugging()")

--<


-- 	Include main function

	Script.Load(Folders.MapTools.."Main.lua")
	Script.Load(Folders.MapTools.."Ai\\Support.lua")
	Script.Load(Folders.MapTools.."Technologies_ForbidAll.lua")	--TF
	Script.Load("maps\\user\\ArchipelagoScript\\archipelago_jobs.lua")
	

	--	globals
	
		IncludeGlobals("Information")
		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("player_1")
		IncludeLocals("player_2")
		IncludeLocals("player_3")
		IncludeLocals("player_5")
		IncludeLocals("player_6")
		IncludeLocals("player_7")


		IncludeLocals("destroyVillage")
		IncludeLocals("burnVillage")
		IncludeLocals("gameControl")

		IncludeLocals("briefing_tower1")
		IncludeLocals("briefing_tower2")
		IncludeLocals("briefing_tower3")
		IncludeLocals("briefing_destroyKerberos")
		IncludeLocals("briefing_regentDialog")
		IncludeLocals("briefing_bishopDialog")
		IncludeLocals("briefing_escapingBishop")
		IncludeLocals("briefing_leoDialog")
		IncludeLocals("briefing_explodingStones")
		IncludeLocals("briefing_traderNorthDialog")
		IncludeLocals("briefing_traderEastDialog")
		IncludeLocals("briefing_regentTributePaid")
		IncludeLocals("briefing_bishopTributePaid")
		IncludeLocals("briefing_reachTownExit")
		
		IncludeLocals("quest_defeat")
		IncludeLocals("quest_tower1")
		IncludeLocals("quest_tower2")
		IncludeLocals("quest_tower3")
		IncludeLocals("quest_regent")
		IncludeLocals("quest_bishop")
		IncludeLocals("quest_destroyKerberos")
		IncludeLocals("quest_escapingBishop")
		IncludeLocals("quest_leo")
		IncludeLocals("quest_explodingStones")
		IncludeLocals("quest_traderNorth")
		IncludeLocals("quest_traderEast")
		IncludeLocals("quest_reachTownExit")

		IncludeLocals("quest_trader1")
		IncludeLocals("quest_trader2")
		IncludeLocals("quest_trader3")
		
		
		IncludeLocals("army_tower1")
		IncludeLocals("army_tower2")
		IncludeLocals("army_defenders1")
		IncludeLocals("army_defenders2")
		IncludeLocals("army_resources1")
		IncludeLocals("army_resources2")
		IncludeLocals("army_regent")
		IncludeLocals("army_enemyCastle")
		IncludeLocals("army_swamp1")
		IncludeLocals("army_swamp2")
		
	
		IncludeLocals("Map_LocalInit")		--TF_Include!
		IncludeLocals("Cutscene_Control")

	
		
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()

		Display.SetPlayerColorMapping(2, 4 )		-- Crawford
		Display.SetPlayerColorMapping(3, 14 )		-- Outposts
		Display.SetPlayerColorMapping(4, KERBEROS_COLOR)		-- former South village now defender
		Display.SetPlayerColorMapping(7, KERBEROS_COLOR)		-- former Bishop now tower
		Display.SetPlayerColorMapping(8, 4)		-- Leonardo
		Display.SetPlayerColorMapping(5, KERBEROS_COLOR)		-- Kerberos' units
		Display.SetPlayerColorMapping(6, ROBBERS_COLOR)			-- Robbers in Swamp
		
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	--	player 5 is enemy of player 1, 2 and 4
	
		Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 2, 5, Diplomacy.Hostile )
		Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile)
		Logic.SetDiplomacyState( 2, 7, Diplomacy.Hostile)
		Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile)
		Logic.SetDiplomacyState( 2, 3, Diplomacy.Hostile)
	--	player 1 is friend of player 2,3,7,8
	
		Logic.SetDiplomacyState( 1, 2, Diplomacy.Friendly )
		Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly)

	-- player 1 is enemy to player 6 (robbers in swamp)
	
		Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
					
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

	
	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(1, 600, 1, 1, 5, 10)
	Logic.AddWeatherElement(2,  90, 1, 2, 5, 10)
  
 
		-- [fun]  AddWeatherElement
		--          Add weather period on end of periods.
		-- Param1: Weather State of period, 1 = normal, 2 = rain, 3 = snow
		-- Param2: Duration of period in seconds
		-- Param3: Is periodic, 1 for (normal)periodic weather element else 0 for weather machine effects
		-- Param4: Gfx Set of this weather element
		-- Param5: Gfx Set forerun (gfx transition start some time before logic state change), time in seconds
		-- Param6: duration of Gfx Set transition
 
end






	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	
	uniqueTributeCounter = 1

	String.Init("CM01_04_Crawford_Txt")

	Logic.SetShareExplorationWithPlayerFlag(1, 2, 1)

	archipelago_init()
	HeroSpawn()
	enableTechsOutOfGDB()

	setup_Map04()

	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer5()
	createPlayer6()
	createPlayer7() --problem somehow


	-- Set Music-Set
	
		LocalMusic.UseSet = EUROPEMUSIC
	
	-- Set quests unfound
	
			--	for i = 1,8 do
			--		Logic.AddQuest(1, i, 0,	"CM_GenericText/QuestNotFound_Name","CM_GenericText/QuestNotFound_Desc", 0)
			--	end
	

	--	chest handling

		StartSimpleJob("isDeadCamp1")
		StartSimpleJob("isDeadCamp2")

--		CreateChestOpener("Dario")
--		CreateChestOpener("Erec")
--		CreateChestOpener("Helias")
--		CreateChestOpener("Ari")
--		CreateChestOpener("Pilgrim")
--		CreateChestOpener("Salim")
	
		CreateRandomChests()
		
		StartChestQuest()



	-- Intro / Start quests

	StartBinkVideo("Crawford")				-- start fresko bink

	burnVillage()

	StartCutscene("Intro", StartIntroPart2)


-- Debugg

	-- StartCutscene("CutsceneComplete")
	
	--	MapLocal_StartCountDown(65)
	
	-- createBriefingHeliasAmulett()
	-- createBriefingTower3()
	
	--	Defeat()
	--	EnableDebugging()
	
	--	EnableDebugging()
	--	createQuestReachTownExit()
	--	
	--	createQuestRegent()
	--	createQuestBishop()
	--	createQuestLeo()
	--	createQuestEscapingBishop()
	--	createQuestTraderNorth()
	--	createQuestTraderEast()
	--
	--
	--	startQuestDestroyKerberos()

end


StartIntroPart2 = function()

	StartCutscene("Cutscene1", startQuestTower1)

end

function isDeadCamp1()
	if GlobalMissionScripting.IsEntityDestroyed("tower1a") and	GlobalMissionScripting.IsEntityDestroyed("tower1b") then
		checkLocation("crawford_west_base")
		return true
	end
end

function isDeadCamp2()
	if GlobalMissionScripting.IsEntityDestroyed("tower2a") and	GlobalMissionScripting.IsEntityDestroyed("tower2b") then
		checkLocation("crawford_east_base")
		return true
	end
end
