createQuestBuildUpVillage = function()

	-- Quest
	local Quest = {}
	Quest.AreaPos = "BuildUpQuestPos"
	Quest.AreaSize = 6400
	
	Quest.EntityTypes = { 	{ Entities.PB_Residence3, 6}}
	
	Quest.Callback = BuildUpVillageFinished

	SetupEstablish(Quest)
end

BuildUpVillageFinished = function()

	end5thQuest()
end