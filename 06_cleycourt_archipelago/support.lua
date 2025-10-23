-------------------------------------------------------------------------------------------------------
--
--	                GLOBAL DEFINES
--
-------------------------------------------------------------------------------------------------------
	
UPGRADE     = 0
TECHNOLOGY  = 1

LOW_EXPERIENCE 			= 0
MEDIUM_EXPERIENCE 		= 1
HIGH_EXPERIENCE 		= 2
VERYHIGH_EXPERIENCE 	= 3

TimeLine = {}
TimeLine.Seconds = 0
TimeLine.Enter = function(_name,_time,_job)
	AI.TimeLine_AddEvent(_name,_time,_job)
	end
TimeLine.Update = function()
	AI.TimeLine_Update(TimeLine.Seconds)
	TimeLine.Seconds = TimeLine.Seconds +1
	end
TimeLine.Start = function()
	TimeLine.JobId = StartJob("TimeLineJob")
	end
TimeLine.End = function()
	EndJob(TimeLine.JobId)
	end

invalidPosition = { X=-1 , Y=-1 }

DebugOn = 0



-------------------------------------------------------------------------------------------------------
--
--	                EnableDebugging()
--
-------------------------------------------------------------------------------------------------------

EnableDebugging = function()
    Input.KeyBindDown(Keys.NumPad1,"GUI.ToggleMinimapDebug()")
    Input.KeyBindDown(Keys.NumPad2,"CreateDebugTroops()")
    Report("NumPad 1: Minimap Debug Support")
    Report("NumPad 2: Create friendly troops at cursor position")
    SpeedUpGame()
    DebugOn = 1
    ResearchAllUniversityTechnologies(1)
    Display.SetRenderFogOfWar(-1) 
    GUI.MiniMap_SetRenderFogOfWar(-1)

	-- 	output mouse information
    	StartJob("Modifier")

	-- 	only testing    
	--    TimeLine.Start()    
    --	TimeLine.Enter("Output Grawumm",20,"test")	
    
    
	end

test = function()
	Report("GRAWUMM!!")	
	end

-------------------------------------------------------------------------------------------------------
--
--	                DisableDegugging()
--
-------------------------------------------------------------------------------------------------------

DisableDegugging = function()
    DebugOn = 0
    Display.SetRenderFogOfWar(-1) 
    GUI.MiniMap_SetRenderFogOfWar(-1)
	end

-------------------------------------------------------------------------------------------------------
--
--	                CreateDebugTroops()
--
-------------------------------------------------------------------------------------------------------

CreateDebugTroops = function()
	
	local position = {}
	
	position.X,position.Y = GUI.Debug_GetMapPositionUnderMouse()
	
	if position.X == -1 then
		Report("invalid mouse position")
		return
		end
	
	local troopDescription = {
	
		leaderType 			= Entities.PU_LeaderBow2,
		soldierType			= Entities.PU_SoldierBow2,
		maxNumberOfSoldiers	= 9,
		minNumberOfSolderis	= 9,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}			

	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  
	
	troopDescription.leaderType = Entities.PU_LeaderSword2
	troopDescription.soldierType = Entities.PU_SoldierSword2

	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  
	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  

--	troopDescription.leaderType = Entities.PU_LeaderCavalry3
--	troopDescription.soldierType = Entities.PU_SoldierCavalry3

--	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  
--	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  
--	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  

	troopDescription.leaderType = Entities.PV_Cannon2

--	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  
--	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  
--	CreateTroop(GUI.GetPlayerID(),position,troopDescription)  

	end

-------------------------------------------------------------------------------------------------------
--
--	                <jobId> StartJob(<nameOfJob>)
--
-------------------------------------------------------------------------------------------------------

StartJob = function(_JobName)
	return Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND,"Condition_".._JobName,"Action_".._JobName,1)
	end

-------------------------------------------------------------------------------------------------------
--
--	                EndJob(<jobId>)
--
-------------------------------------------------------------------------------------------------------

EndJob = function(_JobId)
	Trigger.UnrequestTrigger(_JobId)
	end

-------------------------------------------------------------------------------------------------------
--
--	                Report(<text>)
--
-------------------------------------------------------------------------------------------------------
	
Report = function(_Text)
	if DebugOn == 1 then
		GUI.AddNote("DEBUG REPORT: ".._Text)
		end
	end

-------------------------------------------------------------------------------------------------------
--
--	                Message(<text>)
--
-------------------------------------------------------------------------------------------------------
	
Message = function(_Text)
	GUI.AddNote(_Text)
	end

-------------------------------------------------------------------------------------------------------
--
--	                <state> IsValid(<name of entity>)
--
-------------------------------------------------------------------------------------------------------

IsValid = function(_nameOfEntity)
	return Logic.GetEntityIDByName(_nameOfEntity) ~= 0
	end

-------------------------------------------------------------------------------------------------------
--
--	                <position table> GetPosition(<name of entity | id of entity>)
--
-------------------------------------------------------------------------------------------------------

GetPosition = function(_entity)
	local position = {}
	if type(_entity) == "string" then
		GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName(_entity),position)
	else
		GlobalMissionScripting.GetEntityPosition(_entity,position)
		end
	return position
	end

-------------------------------------------------------------------------------------------------------
--
--	                SpeedUpGame()
--
-------------------------------------------------------------------------------------------------------

SpeedUpGame = function()
    for i=1,20,1 do
        Game.GameTimeSpeedUp()
        end
    end

-------------------------------------------------------------------------------------------------------
--
--	                IncludeLocals(<table of scriptnames>)
--
-------------------------------------------------------------------------------------------------------
	
IncludeLocals = function(_scriptNames)
    if type(_scriptNames) == "table" then
        table.foreach(_scriptNames,function(_,_value)Script.Load(Folders.Map.._value..".lua")end)
    else
        Script.Load(Folders.Map.._scriptNames..".lua")
        end
	end

-------------------------------------------------------------------------------------------------------
--
--	                IncludeGlobals(<table of scriptnames>)
--
-------------------------------------------------------------------------------------------------------
	
IncludeGlobals = function(_scriptNames)
	local globalFolder  = "Data\\Script\\MapTools\\"
    if type(_scriptNames) == "table" then
        table.foreach(_scriptNames,function(_,_value)Script.Load(globalFolder.._value..".lua")end)
    else
        Script.Load(globalFolder.._scriptNames..".lua")
        end
	end
    
-------------------------------------------------------------------------------------------------------
--
--	                FeedAiWithConstructionPlanFile(<playerId>,<table with plan file>)
--
-------------------------------------------------------------------------------------------------------
	
FeedAiWithConstructionPlanFile = function(_playerId,_planFile)
    table.foreach(_planFile,function(_,_value)AI.Village_StartConstruction(_playerId,_value.type,_value.pos.X,_value.pos.Y,0)end)
	end

-------------------------------------------------------------------------------------------------------
--
--	                FeedArmyWithWaypoints(<playerId>,<army id>,<waypoint callback>,<table with waypoint names>)
--
-------------------------------------------------------------------------------------------------------
	
FeedArmyWithWaypoints = function(_playerId,_armyId,_callback,_waypointFile)
    AI.Army_SetWaypointCallback(_playerId,_armyId,_callback)
    table.foreach(_waypointFile,function(_,_value)AI.Army_AddWaypoint(_playerId,_armyId,Logic.GetEntityIDByName(_value))end)
	end

-------------------------------------------------------------------------------------------------------
--
--	                <entityId> CreateTroop(<playerId>,<position>,<troop description table>)
--
-------------------------------------------------------------------------------------------------------
	
CreateTroop = function(_playerId,_position,_desc)

		return AI.Entity_CreateFormation(
			_playerId,
			_desc.leaderType,
			_desc.soldierType,
			_desc.maxNumberOfSoldiers,
			_position.X,_position.Y,
			0,0,
			_desc.experiencePoints,
			_desc.minNumberOfSolderis
		)

	end
	
-------------------------------------------------------------------------------------------------------
--
--	                FeedAiWithResearchPlanFile(<playerId>,<table with plan file>)
--
-------------------------------------------------------------------------------------------------------
	
FeedAiWithResearchPlanFile = function(_playerId,_planFile)
    table.foreach(_planFile,function(_,_value)if _value.location ~= nil then AI.Village_StartResearch(_playerId,_value.type,_value.prob,_value.command,_value.location)else AI.Village_StartResearch(_playerId,_value.type,_value.prob,_value.command)end end)    
	end

-------------------------------------------------------------------------------------------------------
--
--	                ResearchAllUniversityTechnologies(<playerId>)
--
-------------------------------------------------------------------------------------------------------
	
ResearchAllUniversityTechnologies = function(_playerId)
	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Mercenaries,3)	
	Logic.SetTechnologyState(_playerId,Technologies.GT_StandingArmy,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Tactics,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Strategies,3)
	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Construction,3)	
	Logic.SetTechnologyState(_playerId,Technologies.GT_ChainBlock,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_GearWheel,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Architecture,3)
	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Alchemy,3)	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Alloying,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Metallurgy,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Chemistry,3)
	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Taxation,3)	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Trading,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Banking,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Gilds,3)
	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Literacy,3)	
	Logic.SetTechnologyState(_playerId,Technologies.GT_Printing,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Laws,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Library,3)
	end

-------------------------------------------------------------------------------------------------------
--
--	                <state flag> IsDead(<name of entity>)
--
-------------------------------------------------------------------------------------------------------

IsDead = function(_name)

	local entityId = Logic.GetEntityIDByName(_name)
	
	if entityId == 0 then
		return true
		end
	
	if AI.Entity_IsDead() == 1 then
		return true
		end
		
	return false
	
	end

-------------------------------------------------------------------------------------------------------
--
--	                <state flag> IsAlive(<name of entity>)
--
-------------------------------------------------------------------------------------------------------

IsAlive = function(_name)

	return IsDead(_name) ~= true
	
	end

-------------------------------------------------------------------------------------------------------
--
--	                SetupPlayerAi(<playerId>,<description table>)
--
-------------------------------------------------------------------------------------------------------

SetupPlayerAi = function(_playerId,_description)

		AI.Player_EnableAi(_playerId)

		if _description.resources ~= nil then		
			AI.Player_SetResources(_playerId,_description.resources.gold,_description.resources.clay,_description.resources.iron,_description.resources.sulfur,_description.resources.stone,_description.resources.wood)
			end
	
		if _description.refresh ~= nil then		
			AI.Player_SetResourceRefreshRates(_playerId,_description.refresh.gold,_description.refresh.clay,_description.refresh.iron,_description.refresh.sulfur,_description.refresh.stone,_description.refresh.wood,_description.refresh.updateTime)
			end
		
		if _description.serfLimit ~= nil then
			AI.Village_SetSerfLimit(_playerId,_description.serfLimit)
			end
			
		if _description.resourceFocus~= nil then
			AI.Village_SetResourceFocus(_playerId,_description.resourceFocus)
			end
			
		end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Modifier"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Modifier = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_Modifier = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local text

		--	collect information about the current selected entity
		-- 	*****************************************************
		
			local selectedEntityId = GUI.GetSelectedEntity()
			
			local positionOfSelectedEntityId = {}		
			
			if selectedEntityId ~= 0 then
				positionOfSelectedEntityId = GetPosition(selectedEntityId)
				end

		--	get the current mouse position
		--	******************************

			local position = {}		
			
			position.X,position.Y = GUI.Debug_GetMapPositionUnderMouse()			
		
		--	compute the distance between selected entity and mouse
		--	******************************************************
		
			local distance
		
			if selectedEntityId ~= 0 then
				distance = 	math.sqrt(
								(position.X - positionOfSelectedEntityId.X) * (position.X - positionOfSelectedEntityId.X) + 
								(position.Y - positionOfSelectedEntityId.Y) * (position.Y - positionOfSelectedEntityId.Y)
							)
			else
				distance = 0
				end
		
		-- 	output the debug information
		--	****************************					
			
			if distance == 0 then
				text = "MouseX: "..position.X.." MouseY: "..position.Y.." Seconds: "..TimeLine.Seconds
			else
				text = "MouseX: "..position.X.." MouseY: "..position.Y.." Distance: "..distance.." Seconds: "..TimeLine.Seconds
				end
			
			GUI.MiniMapDebug_SetText(text)
				
		return false
		
		end		
-----------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimeLineJob"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeLineJob = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimeLineJob = function()
	-------------------------------------------------------------------------------------------------------------------
	    
	    TimeLine.Update()		
		
		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------


