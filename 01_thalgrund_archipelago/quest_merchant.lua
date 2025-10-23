
createQuestMerchant = function()

	InitNPCLookAt("NPC_Market1")
	
	end
	
	
	
	
	
destroyQuestMerchant = function()

	DisableNpcMarker("NPC_Market1")

	local Job1 = {}
	
	Job1.Tribute = 004

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."Merchant_Tribute1", 
						ResourceType.Iron, 
						200 )

	Job1.Resources 	= { gold = 300 }

	Job1.Callback 	= TributeMerchantPaid1

	SetupTributePaid(Job1)

	end



TributeMerchantPaid1 = function()
	
	local Job1 = {}
	
	Job1.Tribute = 005

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."Merchant_Tribute2", 
						ResourceType.Iron, 
						350 )

	Job1.Resources 	= { gold = 500 }

	Job1.Callback 	= TributeMerchantPaid2

	SetupTributePaid(Job1)

	return true
	
	end




TributeMerchantPaid2 = function()
	
	return true
	
	end
	
