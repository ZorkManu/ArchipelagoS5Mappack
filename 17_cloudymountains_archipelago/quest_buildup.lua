createQuestBuildUp = function()

	-- Build up job
	StartJob("BuildUpQuest")

end

Condition_BuildUpQuest = function()

-- zivile Arbeiter (keine soldaten/serfs)
	return Logic.GetNumberOfAttractedWorker(gvMission.PlayerID) > 100 and briefingIsActive ~= true

end

Action_BuildUpQuest = function()

	checkLocation("cloudy_mountains_prospering_village")

	-- Quest done
	end2ndQuest()
	
	return true
end