createQuestRescueVillage = function()

	local Quest = {}
	Quest.Gift = "Gift"
	
	Quest.Army = ArmyP2FirstAttack


	Quest.ApproachPos = "OccupyingPos"
	Quest.ApproachRange	= 6400

	Quest.Callback = end2ndQuest
	
	SetupRescue(Quest)
end