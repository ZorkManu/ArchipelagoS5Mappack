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
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
end
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to set the player colors
function Mission_InitPlayerColorMapping()

--  Player _DstPlayerID will use color of player _SrcPlayerID. Params: _DstPlayerID, _SrcPlayerID.
	Display.SetPlayerColorMapping(1,PLAYER_COLOR)
	Display.SetPlayerColorMapping(2,2)
	Display.SetPlayerColorMapping(3,8)
	Display.SetPlayerColorMapping(4,15)
	Display.SetPlayerColorMapping(5,KERBEROS_COLOR)
	Display.SetPlayerColorMapping(6,15)
	Display.SetPlayerColorMapping(7,PLAYER_COLOR)
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
	
	WeatherSets_SetupEvelance(1)
	WeatherSets_SetupEvelanceRain(2)
	WeatherSets_SetupEvelanceSnow(3)
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




	-- Attach soldiers
	local i
	for i=1,3 do
		Tools.AttachSoldiersToLeader("RescueObject"..i, 8)
	end
	
	String.Init("CM01_19_Wasteland_Txt")

	-- Load mission files
	
 	IncludeLocals("gameControl")
	IncludeLocals("tributecontrol")
	IncludeLocals("Map_LocalInit")

	IncludeLocals("player_2")
	IncludeLocals("player_3")
	IncludeLocals("player_4")
	IncludeLocals("player_5")
	IncludeLocals("player_6")
	IncludeLocals("player_7")

	IncludeLocals("briefing_mapstart")
	IncludeLocals("briefing_prelude")
	IncludeLocals("briefing_rain")
	IncludeLocals("briefing_fugitive")
	IncludeLocals("briefing_buildup")
	IncludeLocals("briefing_dryvillage")
	IncludeLocals("briefing_swamp")
	IncludeLocals("briefing_weathermaster")
	IncludeLocals("briefing_weathermaster_off")
	
	IncludeLocals("quest_buildupvillage")
	IncludeLocals("quest_rain")
	IncludeLocals("quest_searchAllies")
	IncludeLocals("quest_snow")
	IncludeLocals("quest_reachmountainfortress")
	IncludeLocals("quest_rescuevillagers")
	IncludeLocals("quest_weathermaster")
	IncludeLocals("quest_buildAlchemy")
	
	
	IncludeLocals("army_centeroutpost")
	IncludeLocals("army_leftfortress")
	IncludeLocals("army_rightfortress")

       IncludeLocals("Cutscene_Control")
       
       
    String.Init("CM01_19_Wasteland_Txt")

	archipelago_init()
	enableTechsOutOfGDB()

	--	chest handling

	StartSimpleJob("isDeadP2")
	StartSimpleJob("isDeadOutpost1")
	StartSimpleJob("isDeadOutpostPrison")
	Trigger.RequestTrigger(Events.LOGIC_EVENT_ENTITY_CREATED, "", "isBuildVillageCenterWinter", 1);
	
		CreateRandomGoldChests()
		CreateRandomChests()
		
		StartChestQuest()
	

	
	-- Start time line
--	TimeLine.Start()
	LocalMusic.UseSet = EVELANCEMUSIC

	InitMapNPCs()      
	-- Start prelude
	start1stQuest()
	
--	EnableDebugging()

end

function isDeadP2()
	if GlobalMissionScripting.IsEntityDestroyed("P2HQ") then
		checkLocation("wasteland_destroy_highport")
		return true
	end
end

function isDeadOutpost1()
	if GlobalMissionScripting.IsEntityDestroyed("KI2_Outpost") then
		checkLocation("wasteland_destroy_outpost_ashford")
		return true
	end
end

function isDeadOutpostPrison()
	if GlobalMissionScripting.IsEntityDestroyed("KI2_Outpost") then
		checkLocation("wasteland_destroy_outpost_prison")
		return true
	end
end
function isBuildVillageCenterWinter()
	local id = Event.GetEntityID();
    if Logic.GetEntityType(id) == Entities.PB_VillageCenter1 and Logic.EntityGetPlayer(id) == 1 then
        local x, y = Logic.EntityGetPos(id);
        if x == 34600 and y == 40900 then
            checkLocation("wasteland_village_center_winter")
        end;
    end;
end