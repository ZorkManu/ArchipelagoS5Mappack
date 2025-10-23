--------------------------------------------------------------------------------
-- MapName: 	CM_20_BattleOfEvelance
-- Author: 		Andreas Nitsche, Thomas Friedmann
--                                                                              
-- Quest: 	                                                                    
--                                                                              
----------------------------------------------------------------------------------
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	Input.KeyBindDown (Keys.NumPad0, "Cheat_Trader1_Start()")
	Input.KeyBindDown (Keys.NumPad4, "Cheat_Trader3_Start()")


	-- Include main function
		Script.Load( "Data\\Script\\MapTools\\Main.lua" )
		Script.Load("maps\\user\\ArchipelagoScript\\archipelago_jobs.lua")

	--	globals
	
		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("player_1")
		IncludeLocals("player_4")
		IncludeLocals("player_5")

		IncludeLocals("gameControl")
		IncludeLocals("tributeControl")
	
		IncludeLocals("quest_defeat")
		IncludeLocals("quest_destroyOutpost")
		IncludeLocals("quest_destroyLionsDen")
		IncludeLocals("quest_trader1")
		IncludeLocals("quest_trader2")
		IncludeLocals("quest_trader3")
		IncludeLocals("quest_reinforcements")
		IncludeLocals("quest_wetCannons")
		IncludeLocals("quest_reachWeatherMachine")
		IncludeLocals("quest_rewards")
		IncludeLocals("quest_weatherMaker")
		
		IncludeLocals("army_attack1")
		IncludeLocals("army_attack2")
		IncludeLocals("army_attack3")
		IncludeLocals("army_minePatrol")
		IncludeLocals("army_defendDen")
		IncludeLocals("army_defendMines")
		
		IncludeLocals("briefing_prelude")
		IncludeLocals("briefing_trader1")
		IncludeLocals("briefing_trader2")
		IncludeLocals("briefing_trader3")
		IncludeLocals("briefing_explodingCannons")
		IncludeLocals("briefing_Trader2Paid")
		IncludeLocals("briefing_ReinforcementArrives")
		IncludeLocals("briefing_gatesOpen")
		IncludeLocals("briefing_weatherMachine")
		IncludeLocals("briefing_miner1")
		IncludeLocals("briefing_weatherMaker")

		IncludeLocals("Cutscene_Control")		--TF_Include!
		IncludeLocals("Map_LocalInit")			--TF_Include!


-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()
	
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Friendly )

end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
--function Tools.GiveResouces(_PlayerID, _gold, _clay,_wood, _stone,_iron,_sulfur)
	GlobalMissionScripting.GiveResouces(gvMission.PlayerID, 2000, 1200, 2000, 1200, 1200, 1200)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

		Display.SetPlayerColorMapping(2, NPC_COLOR)				-- NPCs
		Display.SetPlayerColorMapping(6, PLAYER_COLOR)			-- Player's walls

		Display.SetPlayerColorMapping(3, KERBEROS_COLOR)		-- Kerberos walls
		Display.SetPlayerColorMapping(4, KERBEROS_COLOR)		-- Kerberos Outpost
		Display.SetPlayerColorMapping(5, KERBEROS_COLOR)		-- Kerberos inner Castle
		Display.SetPlayerColorMapping(6, PLAYER_COLOR)			-- Player's walls

end



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()

	--	set up all players

end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	Display.SetRenderUseGfxSets(1)
	
	WeatherSets_SetupEvelance(1)
	WeatherSets_SetupEvelanceRain(2)
	WeatherSets_SetupEvelanceSnow(3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	
--	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(3, 200, 1, 3, 5, 10)
--	Logic.AddWeatherElement(2, 500, 1, 2, 5, 10)
  
 
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
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		String.Init("CM01_20_BattleOfEvelance_Txt")


	-- Set Music-Set
		LocalMusic.UseSet = EVELANCEMUSIC

	--	chest handling

		archipelago_init()
		HeroSpawn()
		enableTechsOutOfGDB()
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()


	-- Create players
		createPlayer1()
		createPlayer4()
		createPlayer5()

	-- Start prelude

		StartCutscene("Intro", startQuestDestroyOutpost)

end