
createBriefingMerchantDialog = function()

	briefingMerchantDialog = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingMerchantDialog[page] 			= 	{}
		briefingMerchantDialog[page].title		= 	String.Key("briefingMerchantDialog[1].title")
		briefingMerchantDialog[page].text		=	String.Key("briefingMerchantDialog[1].text")
		briefingMerchantDialog[page].position	=	GetPosition("Merchant")
		briefingMerchantDialog[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingMerchantDialog[page] 			= 	{}
		briefingMerchantDialog[page].title		= 	String.Key("briefingMerchantDialog[1].title")
		briefingMerchantDialog[page].text		=	String.Key("briefingMerchantDialog[2].text")
		briefingMerchantDialog[page].position	=	GetPosition("MerchantMarket")

	--	go!
	
		StartBriefing(briefingMerchantDialog)
		
	end