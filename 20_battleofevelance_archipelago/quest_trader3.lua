
-- Sells exploration of secret path to outpost

-- TRIBUTE003_LEADER_TYPE = Entities.PU_LeaderSword1

createQuestTrader3 = function()

	InitNPCLookAt("trader3")
	
	end


	
destroyQuestTrader3 = function()

	DisableNpcMarker("trader3")
	
	SetupTribut003()

	end



SetupTribut003 = function()
	
	local job = {}
	
	job.Tribute = 003

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Merchant3", 
						ResourceType.Gold, 
						1000 )

	job.Callback 	= TributePaid003

	SetupTributePaid(job)

	end
	

	
	
TributePaid003 = function()
	
	Report("tribute 003 paid")
	
	for i = 1, 15 do
		
		Explore.Show(i, "SecretWay"..i, 900)
		
	end

end

