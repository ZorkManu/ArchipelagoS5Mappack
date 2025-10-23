--------------------------------------------------------------------------------
-- MapName: Cleycourt
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
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly )
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile )

	Logic.SetDiplomacyState( 3, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 3, 4, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
    Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(3,4)
	Display.SetPlayerColorMapping(4,2)
	Display.SetPlayerColorMapping(8,NPC_COLOR)


end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	-- Generate resources
	GeneratePlayerResources(3)--(2)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_Weathermachine, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_WeatherForecast, 0)
	Logic.SetTechnologyState(gvMission.PlayerID,Technologies.T_ChangeWeather, 0)

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

	Logic.AddWeatherElement(1, 5, 1, 1, 5, 10)

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()
	String.Init("CM01_11_Norfolk_Txt")

	-- Load mission files

	IncludeLocals("army_p2attacker")
	IncludeLocals("army_p2defense")
	IncludeLocals("army_p2winterattacker")
	IncludeLocals("army_p3defense")
	IncludeLocals("army_p4attacker")
	IncludeLocals("army_p4defense")
	IncludeLocals("army_p4intruders")
	IncludeLocals("army_p4winterattacker")

	IncludeLocals("briefing_ingredients")
	IncludeLocals("briefing_ironmines")
	IncludeLocals("briefing_leonardo")
	IncludeLocals("briefing_mayor")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_priest")
	IncludeLocals("briefing_priesthealed")
	IncludeLocals("briefing_water")
	IncludeLocals("briefing_HolzMichl")
	IncludeLocals("briefing_WinterWarning")
	IncludeLocals("briefing_PlayerWeatherChange")
	
	IncludeLocals("gameControl")

	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")

	IncludeLocals("quest_defeat")
	IncludeLocals("quest_defendnorfolk")
	IncludeLocals("quest_escortmessanger")
	IncludeLocals("quest_getingredients")
	IncludeLocals("quest_getwater")
	IncludeLocals("quest_leonardo")
	IncludeLocals("quest_winterattack")
	IncludeLocals("quest_protectNorfolk")
	IncludeLocals("quest_PlayerWeatherChange")
	IncludeLocals("quest_ReachLeo")

       IncludeLocals("Map_LocalInit")
       IncludeLocals("Cutscene_Control")
       
       LocalMusic.UseSet = HIGHLANDMUSIC 


	String.Init("CM01_11_Norfolk_Txt")

	archipelago_init()
	HeroSpawn()
	enableTechsOutOfGDB()

	StartSimpleJob("isDeadKerberos")
	StartSimpleJob("isDeadVarg")

	--	chest handling

--		CreateChestOpener("Dario")
--		CreateChestOpener("Erec")
--		CreateChestOpener("Helias")
--		CreateChestOpener("Ari")
--		CreateChestOpener("Pilgrim")
--		CreateChestOpener("Salim")
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()


	-- Start time line
	TimeLine.Start()
	
	-- Start cutscene and prelude after
	start1stQuest()
	
	--EnableDebugging()
end

function isDeadKerberos()
	if GlobalMissionScripting.IsEntityDestroyed("Player2") then
		checkLocation("norfolk_kerberos_base")
		return true
	end
end

function isDeadVarg()
	if GlobalMissionScripting.IsEntityDestroyed("Player4") then
		checkLocation("norfolk_barbarian_base")
		return true
	end
end
