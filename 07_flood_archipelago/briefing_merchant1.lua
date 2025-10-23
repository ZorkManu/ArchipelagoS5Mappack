
createBriefingMerchant1 = function()

	briefingMerchant1 = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingMerchant1[page] 				= 	{}
		briefingMerchant1[page].title			= 	String.GenericKey("Merchant")
		briefingMerchant1[page].text			=	String.Key("briefingMerchant1[1].text")
		briefingMerchant1[page].position		=	GetPosition("merchant1")

	--	go!
	
		StartBriefing(briefingMerchant1)
		
	end

	