
createQuestLeo = function()

	InitNPCLookAt("leo")

end






destroyQuestLeo = function()

	DisableNpcMarker("leo")

	local job = {}
	
	job.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Leonardo1", 
						ResourceType.Sulfur, 
						1000 )

--	job.Resources 	= { gold = 200 }

	job.Callback 	= TributePaidLeo

	SetupTributePaid(job)

end






TributePaidLeo = function()
	
	createBriefingExplodingStones()

	-- enable new Technologie sWORDFIGHTER "
	--Logic.SetTechnologyState(GetHumanPlayer(),Technologies.T_UpgradeSword2, 2)
	--Logic.SetTechnologyState(GetHumanPlayer(),Technologies.MU_LeaderSword3, 2 )

	checkLocation("crawford_help_leonardo")

	return true
	
end
	
