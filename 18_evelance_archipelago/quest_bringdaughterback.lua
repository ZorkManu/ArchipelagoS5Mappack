createQuestBringDaughterBack = function()

	SetNPCLookAtTarget("Princess",1)
	SetNPCFollow("Princess", 1, 500)

	-- Near major quest
	local PrincessBack = {}
	PrincessBack.EntityName = "Princess"
	PrincessBack.TargetName = "Major"
	PrincessBack.Distance = 1000
	
	PrincessBack.Callback = PrincessBroughtBack
	
	SetupExpedition(PrincessBack)

end



-------------------------------------------------------------------------------------------------------
-- Princess back by major
-------------------------------------------------------------------------------------------------------
PrincessBroughtBack = function()

	-- Stop job
	EndJob(ProtectPrincessJob)

	-- Disable follow and look at
	InitNPC("Princess")
	
	-- Mission done
	end7thQuest()

	return true
end