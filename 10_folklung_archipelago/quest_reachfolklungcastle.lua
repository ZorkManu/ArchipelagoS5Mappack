createQuestReachFolklungCastle = function()
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, "Condition_IsPlayerNearFolklungCastle", "Action_IsPlayerNearFolklungCastle", 1)
	FolklungCastlePosition = GetPosition("FolklungCastle")
end
--------------------------------------------------------------------------------
-- Is player near Folklung Castle
--------------------------------------------------------------------------------
function Condition_IsPlayerNearFolklungCastle()
	if IsBriefingActive() then
		return false
	end
	return Logic.IsPlayerEntityInArea(gvMission.PlayerID,FolklungCastlePosition.X, FolklungCastlePosition.Y,1200)
end


function Action_IsPlayerNearFolklungCastle()
	
	Report("Near Folklung Castle!")
	end3rdQuest()
	-- Create enemies general
	Logic.SetShareExplorationWithPlayerFlag(gvMission.PlayerID, gvMission.PlayerIDFolklung, 1)
	--Logic.ChangeEntityPlayerID(GetID("Pilgrim"), gvMission.PlayerID)
	--Logic.ChangeEntityPlayerID(GetID("Salim"), gvMission.PlayerID)
	--CreateChestOpener("Pilgrim")
	--CreateChestOpener("Salim")
	checkLocation("folklung_speak_with_pilgrim")
	return 1

end
--------------------------------------------------------------------------------------------

