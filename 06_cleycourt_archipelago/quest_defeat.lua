createQuestDefeat = function()

	StartJob("Defeat")

end

Condition_Defeat = function()

	return 		IsDead("HQ") 
	
end

Action_Defeat = function()
	Defeat()
	return true
end