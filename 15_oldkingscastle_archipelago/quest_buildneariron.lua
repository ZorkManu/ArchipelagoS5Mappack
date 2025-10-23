createQuestBuildNearIron = function()

	-- Create quests
	local i
	for i=1,2 do
		local Quest = {}
		Quest.AreaPos = "IronBuildingCheck"..i
		Quest.AreaSize = 2000
		Quest.Any = true
		
		Quest.Callback = end8thSubQuest
		
		SetupEstablish(Quest)
	end
end