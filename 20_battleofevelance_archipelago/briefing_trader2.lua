
createBriefingTrader2 = function()

	briefingTrader2 = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingTrader2[page] 			= 	{}
		briefingTrader2[page].title		= 	String.Key("briefingTrader2[1].title")
		briefingTrader2[page].text		=	String.Key("briefingTrader2[1].text")
		briefingTrader2[page].position	=	GetPosition("trader2")
		briefingTrader2[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingTrader2)
		
	end