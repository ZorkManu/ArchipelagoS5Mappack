createQuestReachFolklung = function()
	StartJob("IsPlayerNearFolklung")
	FolklungPos1 = GetPosition("P1_IsPlayerNearFolklung1")
	FolklungPos2 = GetPosition("P1_IsPlayerNearFolklung2")
	FolklungPos3 = GetPosition("P1_IsPlayerNearFolklung3")
end



--------------------------------------------------------------------------------
-- Is player near Folklung
--------------------------------------------------------------------------------
function Condition_IsPlayerNearFolklung()
	if IsBriefingActive() then
		return false
	end
	if (Logic.IsPlayerEntityInArea(gvMission.PlayerID,FolklungPos1.X, FolklungPos1.Y,1200) == 1)
		or (Logic.IsPlayerEntityInArea(gvMission.PlayerID,FolklungPos2.X, FolklungPos2.Y,1200) == 1)
		or (Logic.IsPlayerEntityInArea(gvMission.PlayerID,FolklungPos3.X, FolklungPos3.Y,1200)  == 1 )then
		return 1
	end
end


function Action_IsPlayerNearFolklung()
	Report("Folklung reached!")	
	end2ndQuest()
	return 1
end
--------------------------------------------------------------------------------------------

