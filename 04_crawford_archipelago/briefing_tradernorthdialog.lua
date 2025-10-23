
createBriefingTraderNorthDialog = function()

	briefingTraderNorthDialog = 	{}	

		local page = 0

	--	page
	
		page = page +1

		briefingTraderNorthDialog[page] 				= 	{}
		briefingTraderNorthDialog[page].title			= 	String.Key("briefingTraderNorthDialog[1].title")
		briefingTraderNorthDialog[page].text			=	String.Key("briefingTraderNorthDialog[1].text")
		briefingTraderNorthDialog[page].position		=	GetPosition("traderN")
		briefingTraderNorthDialog[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingTraderNorthDialog)

	end
	
	
