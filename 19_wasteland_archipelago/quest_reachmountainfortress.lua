createQuestReachMountainFortress = function()

	-- Use rescue quest
	local Quest = {}
	Quest.ApproachPos = "PreludeQuestPos"
	Quest.ApproachRange = 3000
	
	Quest.Callback = ReachedMountainFortress

	SetupRescue(Quest)

end

ReachedMountainFortress = function()

	-- Quest done
	end1stQuest()

end