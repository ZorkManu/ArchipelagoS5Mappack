createQuestBuyOrb = function()

	-- Tribute job
	local Job = {}
	Job.Tribute = 001

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"CM01_17_CloudyMountains_Txt/tribute_buyOrb", 
						ResourceType.Gold, 
						20000 )
	
	Job.Callback = end6thQuest

	-- Create tribute paid Job
	SetupTributePaid(Job)

end
