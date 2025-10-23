--------------------------------------------------------------------------------
-- MapName: 	Plague
--
-- Author: 		Andreas Nitsche, Thomas Friedmann
--
--------------------------------------------------------------------------------

-- 	Include main function

	Script.Load(Folders.MapTools.."Main.lua")
	Script.Load("maps\\user\\ArchipelagoScript\\archipelago_jobs.lua")

	--	globals

		IncludeGlobals("MapSettings_Main")

	--	locals

		IncludeLocals("gameControl")
	
		IncludeLocals("player_1")
		IncludeLocals("player_2")
		IncludeLocals("player_3")
		IncludeLocals("player_4")
		IncludeLocals("player_6")
		IncludeLocals("player_7")
		IncludeLocals("player_8")
		
		IncludeLocals("quest_searchPilgrim")
		IncludeLocals("quest_searchHelias")
		IncludeLocals("quest_destroyCastle")
		IncludeLocals("quest_bandits")
		IncludeLocals("quest_hireTroops")
		IncludeLocals("quest_defeat")
		IncludeLocals("quest_chestRun")
		IncludeLocals("quest_merchant1")
		IncludeLocals("quest_npcPilgrim")
		IncludeLocals("quest_stoneRun")
		
		IncludeLocals("briefing_prelude")
		IncludeLocals("briefing_pilgrim")
		IncludeLocals("briefing_helias")
		IncludeLocals("briefing_bandits")
		IncludeLocals("briefing_npc1")
		IncludeLocals("briefing_npc2")
		IncludeLocals("briefing_npc3")
		IncludeLocals("briefing_npcPilgrim")
		IncludeLocals("briefing_merchant1")
		IncludeLocals("briefing_banditsDeliverA")
		IncludeLocals("briefing_banditsDeliverB")
		IncludeLocals("briefing_banditsDeliverC")

		
		IncludeLocals("army_southernAssault")
		IncludeLocals("army_castleDefenders")
		IncludeLocals("army_firstLineDefenders")
		IncludeLocals("army_raiders")
		IncludeLocals("army_mainForce")
		IncludeLocals("army_supportA")
		IncludeLocals("army_supportB")
		IncludeLocals("army_supportC")
		
		IncludeLocals("Map_LocalInit")		--TF_Include!
		IncludeLocals("Cutscene_Control")


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile	)
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile 	)
--	Logic.SetDiplomacyState( 6, 2, Diplomacy.Hostile 	)		-- is set when talked to banditLeader
--	Logic.SetDiplomacyState( 6, 3, Diplomacy.Hostile 	)
--	Logic.SetDiplomacyState( 6, 5, Diplomacy.Hostile 	)

	Logic.SetDiplomacyState( 1, 6, Diplomacy.Friendly 	)
	Logic.SetDiplomacyState( 1,	8, Diplomacy.Friendly 	)

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()
	
	Display.SetPlayerColorMapping(2, 16)		-- Mortfichets army
	Display.SetPlayerColorMapping(3, 16)		-- Defenders of Morfichets Castle
	
	Display.SetPlayerColorMapping(4, 4)		-- Village with Pilgrim (Verino)
	Display.SetPlayerColorMapping(6, 8)			-- Aris leader merchant and support troops that follow heroes

	Display.SetPlayerColorMapping(7, NPC_COLOR)				-- NPCs
	Display.SetPlayerColorMapping(8, 15)		-- infected village

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()

	--	resources

		AddGold(400)
		AddIron(200)
		AddWood(500)
		AddClay(1000)
		AddStone(500)
		AddSulfur(0)

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
	
	Logic.AddWeatherElement(1, 600, 1, 1, 10, 20)
	Logic.AddWeatherElement(2,  60, 1, 2, 10, 20)
	Logic.AddWeatherElement(1, 300, 1, 1, 10, 20)
	Logic.AddWeatherElement(2, 150, 1, 2, 10, 20)
	Logic.AddWeatherElement(1, 500, 1, 1, 10, 20)
	Logic.AddWeatherElement(2,  90, 1, 2, 10, 20)
  
 
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
		
	-- Set Music-Set

		LocalMusic.UseSet = MEDITERANEANMUSIC

	--	chest handling

		archipelago_init()
		HeroSpawn()
		enableTechsOutOfGDB()
	
		CreateRandomGoldChests()
		CreateRandomChests()

		startQuestChestRun()

		StartChestQuest()

		Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED, "", "isBuildVillageCenterWinter", 1);
		Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED, "", "isBuildVillageCenterPlagueDorf", 1);

	--
		tributeCounter = 1
		
	--	default actions	
		
		String.Init("CM01_13_Plague_Txt")

		setup_Map13()

		Logic.SetShareExplorationWithPlayerFlag(1, 6, 1)
		Logic.SetShareExplorationWithPlayerFlag(1, 8, 1)

	--	create all players

		createPlayer1()		
		createPlayer2()
		createPlayer3()
		createPlayer4()
		createPlayer6()
		createPlayer7()
		createPlayer8()

	--	entry point

		start1stCutscene()
		

		
end

function isBuildVillageCenterWinter()
	local id = Event.GetEntityID();
    if Logic.GetEntityType(id) == Entities.PB_VillageCenter1 and Logic.EntityGetPlayer(id) == 1 then
        local x, y = Logic.EntityGetPos(id);
        if x == 2400 and y == 26000 then
            checkLocation("plague_village_center_winter")
        end;
    end;
end

function isBuildVillageCenterPlagueDorf()
	local id = Event.GetEntityID();
    if Logic.GetEntityType(id) == Entities.PB_VillageCenter1 and Logic.EntityGetPlayer(id) == 1 then
        local x, y = Logic.EntityGetPos(id);
        if x == 30300 and y == 11600 then
            checkLocation("plague_village_center_plague_village")
        end;
    end;
end
