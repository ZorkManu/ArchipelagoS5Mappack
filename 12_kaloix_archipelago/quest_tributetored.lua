createQuestTributeToRed = function()

	if TributeToRedExists ~= true 
	then
		TributeToRedExists = true
		-- Fill tribute paid table
		local Job = {}
		Job.Tribute = 010
    	
		-- Create tribute
		Logic.AddTribute(	gvMission.PlayerID, 
							Job.Tribute,
							0,
							0,
							"CM01_12_Kaloix/tribute_ToRed", 
							ResourceType.Gold, 
							2000 )
    	
		
		Job.Callback = end6thSubQuest
    	
    	
		-- Create tribute paid Job
		SetupTributePaid(Job)
	end
	

end
