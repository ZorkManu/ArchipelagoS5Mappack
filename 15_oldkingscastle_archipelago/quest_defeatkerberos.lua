createQuestDefeatKerberos = function()

	-- Get current soldier amount
	GiveUpNumberOfLeaders = AI.Player_GetNumberOfLeaders(5) * 0.2

	-- Check for 60% lost
	StartJob("KerberosGiveUp")

end

Condition_KerberosGiveUp = function()

	return 		AI.Player_GetNumberOfLeaders(5) < GiveUpNumberOfLeaders
			or	IsDead("HQ_AI2")
	
end

Action_KerberosGiveUp = function()
	if not IsBriefingActive() then
		end4thQuest()	
		return true
	end
end