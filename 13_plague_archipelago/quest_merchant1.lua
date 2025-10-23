
startQuestMerchant1 = function()

	InitNPCLookAt("merchant1")
	
end




	
endQuestMerchant1 = function()

	DisableNpcMarker("merchant1")

	createBriefingMerchant1()

	local job = {}
	
	job.Tribute = tributeCounter
	
	tributeCounter = tributeCounter+1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Merchant1", 
						ResourceType.Gold, 
						1000 )

	job.Resources 	= { sulfur = 2000 }

	job.Callback 	= TributeMerchantPaid1

	SetupTributePaid(job)

end






TributeMerchantPaid1 = function()
	
	return true
	
end


