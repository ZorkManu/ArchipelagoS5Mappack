
createBriefingTraderEastDialog = function()

	briefingTraderEastDialog = 	{}	

		local page = 0

	--	page
	
		page = page +1

		briefingTraderEastDialog[page] 				= 	{}
		briefingTraderEastDialog[page].title		= 	String.Key("briefingTraderEastDialog[1].title")
		briefingTraderEastDialog[page].text			=	String.Key("briefingTraderEastDialog[1].text")
		briefingTraderEastDialog[page].position		=	GetPosition("traderE")
		briefingTraderEastDialog[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingTraderEastDialog)

	end
	
	
