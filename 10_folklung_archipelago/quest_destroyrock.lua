createQuestDestroyRock = function()
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, "Condition_IsRockDestroyed", "Action_IsRockDestroyed", 1)
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, "Condition_IsRock2Destroyed", "Action_IsRock2Destroyed", 1)
	
	Rock1ID = GetID("TheRock")
	Rock2ID = GetID("TheRock2")
end

--------------------------------------------------------------------------------
-- Has player destroyed "The Rock1"
--------------------------------------------------------------------------------
function Condition_IsRockDestroyed()
	if IsBriefingActive() then
		return false
	end
	if  GlobalMissionScripting.IsEntityDestroyed(Rock1ID) then
		return 1
	end
end


function Action_IsRockDestroyed()
	Report("Rock1 destroyed!")
	ArmyFolklungASetDefensive()
	ArmyBesiegerASetDefensive()
	createBriefingRock1Destroyed()
	return 1
end
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Has player destroyed "The Rock2"
--------------------------------------------------------------------------------
function Condition_IsRock2Destroyed()
	if IsBriefingActive() then
		return false
	end
	if  GlobalMissionScripting.IsEntityDestroyed(Rock2ID) then
		return 1
	end
end


function Action_IsRock2Destroyed()
	Report("Rock2 destroyed!")
	createBriefingRock2Destroyed()
	start5thQuest()
	return 1
end
--------------------------------------------------------------------------------------------