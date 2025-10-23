
createQuestTraderEast = function()

	InitNPCLookAt("traderE")

	end




destroyQuestTraderEast = function()

	DisableNpcMarker("traderE")

	local job = {}
	
	job.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_TraderEast1", 
						ResourceType.Clay, 
						2000 )

	job.Resources 	= { iron = 500 }

	job.Callback 	= TributePaidTraderEast

	SetupTributePaid(job)

end





TributePaidTraderEast = function()

	return true
	
end
	
