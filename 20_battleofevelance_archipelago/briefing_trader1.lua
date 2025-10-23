
createBriefingTrader1 = function()

	briefingTrader1 = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTrader1[page] 			= 	{}
		briefingTrader1[page].title		= 	String.Key("briefingTrader1[1].title")
		briefingTrader1[page].text		=	String.Key("briefingTrader1[1].text")
		briefingTrader1[page].position	=	GetPosition("trader1")
		briefingTrader1[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingTrader1)
		
	end