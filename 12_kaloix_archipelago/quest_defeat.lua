createQuestDefeat = function()

	StartJob("Defeat")

end

Condition_Defeat = function()

	return IsDead("Pl1HQ") and IsBriefingActive() ~= true
end

Action_Defeat = function()
	Defeat()
	return true
end