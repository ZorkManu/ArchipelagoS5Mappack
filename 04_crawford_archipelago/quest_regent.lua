
-- pay iron to Dovbar so that he can setup armies that will attack enemies

createQuestRegent = function()

	regentQuest = {}
	regentQuest.solved = false

	InitNPCLookAt("regent")

end






destroyQuestRegent = function()

	DisableNpcMarker("regent")
	ResolveBriefing(briefingDestroyKerberos[PageRegent])

	local job = {}
	
	job.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Regent1", 
						ResourceType.Iron, 
						1000 )

--	job.Resources 	= { gold = 200 }

	job.Callback 	= TributePaidRegent

	SetupTributePaid(job)

end





TributePaidRegent = function()

	regentQuest.solved = true

	ResolveBriefing(briefingRegentDialog[PageDovbarQuest])

	-- create supporting army und control of player 2
	createArmyRegent()

	-- Ignore if running briefing
	if IsBriefingActive() then
		return true
	else
	-- short Thank-U briefing
		MapLocal_CameraPositionBackup()
		createBriefingRegentTributePaid()
	end

	return true
	
end
	
