createQuestBuildAlchemy = function()

	local Quest = {}
	
	Quest.EntityTypes = { { Entities.PB_Alchemist1, 1 } }
	Quest.Callback = createBriefingSwamp

	SetupEstablish(Quest)

end