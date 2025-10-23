createQuestDestroyKI1 = function()

	-- Destroy destroy ki 1 quest
	local Quest = {}
	Quest.Targets = "KI1_Target"
	
	Quest.Callback = KI1Destroyed

	SetupDestroy(Quest)

end

KI1Destroyed = function()

	end2ndQuest()
		
end
