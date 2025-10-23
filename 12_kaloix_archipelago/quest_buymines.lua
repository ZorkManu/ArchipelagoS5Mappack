createQuestBuyStoneMine = function()

	-- Tribute job
	BuyStoneMineJob = {}
	BuyStoneMineJob.Tribute = 001

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
				BuyStoneMineJob.Tribute,
				0,
				0,
				"CM01_12_Kaloix/tribute_buyMine1", 
				ResourceType.Clay, 
				1200 )
	
	BuyStoneMineJob.Entity = "BuyStoneMine"
	
	BuyStoneMineJob.Callback = end1stSubQuest

	-- Create tribute paid Job
	SetupTributePaid(BuyStoneMineJob)

end

createQuestBuyClayMine = function()

	-- Tribute job
	local Job = {}
	Job.Tribute = 002

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
				Job.Tribute,
				0,
				0,
				"CM01_12_Kaloix/tribute_buyMine2", 
				ResourceType.Stone, 
				1000 )
	
	Job.Entity = "BuyClayMine"
	
	Job.Callback = end2ndSubQuest

	-- Create tribute paid Job
	SetupTributePaid(Job)

end

createQuestBuyIronMine = function()

	-- Tribute job
	local Job = {}
	Job.Tribute = 003

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
				Job.Tribute,
				0,
				0,
				"CM01_12_Kaloix/tribute_buyMine3", 
				ResourceType.Wood, 
				2000 )
	
	Job.Entity = "BuyIronMine"
	
	Job.Callback = end3rdSubQuest

	-- Create tribute paid Job
	SetupTributePaid(Job)

end

createQuestBuySulfurMine = function()

	-- Tribute job
	local Job = {}
	Job.Tribute = 004

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
				Job.Tribute,
				0,
				0,
				"CM01_12_Kaloix/tribute_buyMine4", 
				ResourceType.Gold, 
				2000 )
	
	Job.Entity = "BuySulfurMine"
	
	Job.Callback = end4thSubQuest

	-- Create tribute paid Job
	SetupTributePaid(Job)

end