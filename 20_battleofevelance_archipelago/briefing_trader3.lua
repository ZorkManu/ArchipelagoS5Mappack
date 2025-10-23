
createBriefingTrader3 = function()

	briefingTrader3 = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingTrader3[page] 			= 	{}
		briefingTrader3[page].title		= 	String.Key("briefingTrader3[1].title")
		briefingTrader3[page].text		=	String.Key("briefingTrader3[1].text")
		briefingTrader3[page].position	=	GetPosition("trader3")
		briefingTrader3[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingTrader3)
		
	end