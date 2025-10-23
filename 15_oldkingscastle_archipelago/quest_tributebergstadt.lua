createQuestTributeBergstadt = function()
	
	-- Tribute job
	local Job = {}

	if 	uniqueTributeCounter == nil then 
		uniqueTributeCounter = 1
	end

	Job.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						String.MainKey.."Bergstadt_Tribute1",
						ResourceType.Gold, 
						2000 )
	
	Job.Callback = end2ndSubQuest

	-- Create tribute paid Job
	SetupTributePaid(Job)

end
