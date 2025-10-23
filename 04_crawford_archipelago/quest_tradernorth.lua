
createQuestTraderNorth = function()

	InitNPCLookAt("traderN")

end



destroyQuestTraderNorth = function()

	DisableNpcMarker("traderN")

	local job = {}
	
	job.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_TraderNorth1", 
						ResourceType.Wood, 
						2000 )

	job.Resources 	= { iron = 500 }

	job.Callback 	= TributePaidTraderNorth

	SetupTributePaid(job)

end




TributePaidTraderNorth = function()

	return true
	
end
	
