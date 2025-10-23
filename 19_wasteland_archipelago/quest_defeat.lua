createQuestDefeat = function()

	StartJob("Defeat")

end

Condition_Defeat = function()

	return IsDead("start_1")
end

Action_Defeat = function()
	Defeat()
	return true
end