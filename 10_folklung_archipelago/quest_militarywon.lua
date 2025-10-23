createQuestMilitaryWon = function()
	Report("Quest createQuestMilitaryWon created!")
	MilitaryWonQuest = StartJob("MilitaryWon")
end

function Condition_MilitaryWon()
	-- check victory condition
	if IsBriefingActive() then
		return false
	end
	if 	(Logic.GetNumberOfAttractedSettlers(gvMission.PlayerIDBesieger) == 0) 
	then
		return 1
	end	
end

-- Mission won
function Action_MilitaryWon()
	Report( "Mission military won!" )
	checkLocation("folklung_victory")
	checkLocation("folklung_destroy_enemies")
	end1stQuest()
	return 1	
end
--------------------------------------------------------------------------------