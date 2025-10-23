
-- Sells Cutscene that shows attackers way

createQuestTrader1 = function()
	InitNPCLookAt("trader1")
end

	
	
destroyQuestTrader1 = function()

	DisableNpcMarker("trader1")

	local job = {}
	
		job.Tribute = 001
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.MainKey.."tribute_Merchant1", 
							ResourceType.Gold, 
							1000 )
	
		job.Callback 	= TributePaid001

	SetupTributePaid(job)

end

	
	
TributePaid001 = function()

	Report("tribute 001 paid")

end