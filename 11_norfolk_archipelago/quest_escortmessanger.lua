createQuestEscortMessenger = function()
--	TimeLine.Enter("MessangerText1", TimeLine.Seconds + 12, "MessengerTalk")
--	TimeLine.Enter("MessangerText2", TimeLine.Seconds + 30, "MessengerTalk")
--	TimeLine.Enter("MessangerText3", TimeLine.Seconds + 60, "MessengerTalk")
--	TimeLine.Enter("MessangerText4", TimeLine.Seconds + 90, "MessengerTalk")

	StartJob("EscortQuest")
end

Condition_EscortQuest = function()
	return not IsCutsceneActive() and not IsBriefingActive() and Logic.GetTime() > 1
end
Action_EscortQuest = function()

	local player = 3
	local army = 0
		
	-- Setup army for messanger
	MessengerArmy				=	{}
	
	MessengerArmy.player 		= 	player
	MessengerArmy.id			= 	army
	MessengerArmy.strength		= 	1
	MessengerArmy.position		= 	GetPosition("Dario")
	MessengerArmy.rodeLength	= 	1000
	MessengerArmy.beAgressive	=	true

	MessengerArmy.waypoint =		1

	SetupArmy(MessengerArmy)
	
	AI.Army_EnableLeaderAi(GetEntityId("Messenger"), 1)
	
	AI.Entity_ConnectLeader(GetEntityId("Messenger"), army)

	local WayPoints	=	{}
	for i=1,4 do
		WayPoints[i] = "Waypoint"..i
	end
	FeedArmyWithWaypoints(player, army, "MessengerWait", WayPoints)
	
    -- very low scatter tolerance => hero must be close to army, before the next waypoint will be activated!
    AI.Army_SetScatterTolerance(player, army, 2)
    
    -- tiny army (only one hero and the body guard!)
    AI.Army_SetSize(player, army, 1)	

	MessengerDefeatID = AddDefeatEntity("Messenger", true)

	return true
end

MessengerWait = function(_waypointId)
	
	if IsBriefingActive() then
		return 0
	end

	if _waypointId < 0 then
		return 1
	end
		
--	Report("".._waypointId)
	MessengerWaypoint = _waypointId
	MessengerTalk()
	
	MessengerArmy.waypoint =	_waypointId + 1	
	
    if _waypointId == 3 then

        Report("clear all waypoints")

        AI.Army_ClearWaypoints(MessengerArmy.player,MessengerArmy.id)
        RemoveDefeatCondition(MessengerDefeatID)

        Redeploy(MessengerArmy, GetPosition("Concentrating_Area"))
        
        end1stQuest()
--debug!! Quest sofort erfüllt!
--	else
--        Report("clear all waypoints")
--
--        AI.Army_ClearWaypoints(MessengerArmy.player,MessengerArmy.id)
--        RemoveDefeatCondition(MessengerDefeatID)
--
--        Redeploy(MessengerArmy, GetPosition("Concentrating_Area"))
--        
--        end1stQuest()
--
--
    end

	if Counter.Tick2("Messenger", 200) then
    	return 1
	else
		return 0
	end
	
end

MessengerTalk = function()

	if MessengerTalked[MessengerWaypoint] == nil then
		MessengerTalked[MessengerWaypoint] = true
		MessengerTalkCounter = MessengerTalkCounter + 1
		SpokenMessage(String.MainKey.."MessengerTalk"..MessengerTalkCounter)
	end



end

