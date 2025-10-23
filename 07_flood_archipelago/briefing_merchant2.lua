
createBriefingMerchant2 = function()

	briefingMerchant2 =	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingMerchant2[page] 				= 	{}
		briefingMerchant2[page].title			= 	String.GenericKey("Merchant")
		briefingMerchant2[page].text			=	String.Key("briefingMerchant2[1].text")
		briefingMerchant2[page].position		=	GetPosition("merchant2")

	--	go!
	
		StartBriefing(briefingMerchant2)
		
	end

	