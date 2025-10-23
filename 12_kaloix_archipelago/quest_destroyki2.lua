createQuestDestroyKI2 = function()

	-- Destroy destroy ki 1 quest
	local Quest = {}
	Quest.Targets = "KI2_Target"
	
	Quest.Callback = KI2Destroyed

	SetupDestroy(Quest)

end

KI2Destroyed = function()

	end5thSubQuest ()
		
end
