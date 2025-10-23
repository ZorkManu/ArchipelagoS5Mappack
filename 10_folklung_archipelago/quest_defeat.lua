
createQuestDefeat = function()
	Report("Quest createQuestMilitaryWon created!")
	DefeatQuest = StartJob("ControlDefeat")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlDefeat"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlDefeat = function()
	-------------------------------------------------------------------------------------------------------------------
	if IsBriefingActive() then
		return false
	end
		if IsDead("HQ") then 
			
			return true
			
			end
			
		return false
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlDefeat = function()
	-------------------------------------------------------------------------------------------------------------------
		EndJob(MilitaryWonQuest)
		if (FreeLeaderJob ~= nil) and (FreeLeaderJob ~= 0) then
			EndJob(FreeLeaderJob)
		end
		Defeat()		

		return true
		
		end
