createQuestBuildUpCountessVillage = function()

	-- Fill tribute paid table
	local Job = {}
	Job.Tribute = 005

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"CM01_12_Kaloix/tribute_SupplyVillage1", 
						ResourceType.Clay, 
						400,
						ResourceType.Wood,
						600 )

	
	Job.Callback = end1stQuest


	-- Create tribute paid Job
	SetupTributePaid(Job)


end

