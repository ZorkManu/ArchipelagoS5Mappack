createQuestIronManTribute = function()

	-- Tribute job
	local Job = {}
	Job.Tribute = 002

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"CM01_17_CloudyMountains_Txt/tribute_IronManTributeIron", 
						ResourceType.Clay, 
						2000 )
	
	Job.Callback = IronManTributePaidIron

	-- Create tribute paid Job
	SetupTributePaid(Job)
	
		-- Tribute job
	local Job2 = {}
	Job2.Tribute = 003

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job2.Tribute,
						0,
						0,
						"CM01_17_CloudyMountains_Txt/tribute_IronManTributeSulfur", 
						ResourceType.Clay, 
						2000 )
	
	Job2.Callback = IronManTributePaidSulfur

	-- Create tribute paid Job
	SetupTributePaid(Job2)
	

end

IronManTributePaidIron = function()

	Tools.GiveResouces(1, 0, 0,0,0,1500,0)

end

IronManTributePaidSulfur = function()

	Tools.GiveResouces(1, 0, 0,0,0,0,1500)

end


