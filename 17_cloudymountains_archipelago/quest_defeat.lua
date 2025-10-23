createQuestDefeat = function()

	StartJob("Defeat")

end

Condition_Defeat = function()

	return IsDead("HQ") and briefingIsActive ~= true
end

Action_Defeat = function()
	Defeat()
	return true
end