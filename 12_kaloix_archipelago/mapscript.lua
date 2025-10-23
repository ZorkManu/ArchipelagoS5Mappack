--------------------------------------------------------------------------------
-- MapName: Kaliox
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
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 4, 6, Diplomacy.Hostile )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,6)
	Display.SetPlayerColorMapping(3,4)
	Display.SetPlayerColorMapping(4,15 )
	Display.SetPlayerColorMapping(6,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(7,2)
	Display.SetPlayerColorMapping(8,NPC_COLOR)

end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
-- gold, clay, wood, stone, iron, sulfur
function Mission_InitResources()

	-- Generate resources
	-- GeneratePlayerResources(2)
	Tools.GiveResouces(1, 300, 700, 600, 400, 200, 0)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()

	-- Forbid foundry
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 0)

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
	
	WeatherSets_SetupMediterranean(1)
	WeatherSets_SetupMediterraneanRain(2)
	WeatherSets_SetupMediterraneanSnow(3)
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

	String.Init("CM01_12_Kaloix")

	-- Load mission files
	IncludeLocals("gameControl")
	IncludeLocals("Map_LocalInit")

	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_mines")
	IncludeLocals("briefing_DestroyRedDone")
	IncludeLocals("briefing_RedAttack")
	IncludeLocals("briefing_TributePaid")
	IncludeLocals("briefing_morfichet")
	IncludeLocals("briefing_tributetoredpaid")
	IncludeLocals("briefing_Wiseguy")

	IncludeLocals("quest_BuildUpCountessVillage")
	IncludeLocals("quest_DefendCountessVillage")
	IncludeLocals("quest_CountessVillageTributePaid")
	IncludeLocals("quest_BuyMines")
	IncludeLocals("quest_DestroyKI1")
	IncludeLocals("quest_DestroyKI2")
	IncludeLocals("quest_Defeat")
	IncludeLocals("quest_tributetored")
	
	
	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_6")
	IncludeLocals("player_7")
	
	IncludeLocals("army_KI1")
	IncludeLocals("army_KI1_defense")
	IncludeLocals("army_KI2")
	IncludeLocals("army_KI2_defense")
	IncludeLocals("army_DefenseLeftMines")
	IncludeLocals("army_DefenseRightMines")
	
        IncludeLocals("Cutscene_Control")

	--	chest handling

	archipelago_init()
	HeroSpawn()
	enableTechsOutOfGDB()
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()

	StartSimpleJob("isDeadCampLeft")
	StartSimpleJob("isDeadCampRight")

	
--TK
	
	InitMapNPCs()
	
	GlobalMissionScripting_AttachSoldiersToLeader("P1_BowLeader1",4)

	String.Init("CM01_12_Kaloix")

	
	-- Start time line
	TimeLine.Start()
	
	LocalMusic.UseSet = MEDITERANEANMUSIC
	
	-- Start prelude
	start1stQuest()
end

function isDeadCampLeft()
	if GlobalMissionScripting.IsEntityDestroyed("DefenceLeftMinesHQ") then
		checkLocation("kaloix_defeat_bandits_left")
		return true
	end
end

function isDeadCampRight()
	if GlobalMissionScripting.IsEntityDestroyed("DefenceRightMinesHQ") then
		checkLocation("kaloix_defeat_bandits_right")
		return true
	end
end