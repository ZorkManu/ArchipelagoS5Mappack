createQuestProtectNorfolk = function()

	StartJob("ProtectNorfolk")

end

Condition_ProtectNorfolk = function()

	return IsDead("P3HQ") and IsBriefingActive() ~= true
end

Action_ProtectNorfolk = function()
	Defeat()
	return true
end

