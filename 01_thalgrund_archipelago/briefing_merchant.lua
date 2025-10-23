
createBriefingMerchant = function()

	briefingMerchant =	{}	

	--	briefing finished callback function

		briefingMerchant.finished = BriefingMerchant

		local page = 0

	--	page
	
		page = page +1
	
		briefingMerchant[page] 				= 	{}
		briefingMerchant[page].title		= 	String.Key("briefingMerchant[1].title")
		briefingMerchant[page].text			=	String.Key("briefingMerchant[1].text")
		briefingMerchant[page].position 	= 	GetPosition("NPC_Market1")	
		briefingMerchant[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingMerchant[page] 				= 	{}
		briefingMerchant[page].title		= 	String.Key("briefingMerchant[1].title")
		briefingMerchant[page].text			=	String.Key("briefingMerchant[2].text")
		briefingMerchant[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingMerchant)
	
	end

BriefingMerchant = function()

	end	
