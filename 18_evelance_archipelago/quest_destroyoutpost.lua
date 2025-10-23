createQuestDestroyOutpost = function()

	-- Free way
	local i
	for i=1,3 do
		DestroyEntity("BlockingStone"..i)
	end

	local Quest = {}
	Quest.Target = "DespairHQ"
	
	Quest.Callback = end6thQuest
	
	SetupDestroy(Quest)

end