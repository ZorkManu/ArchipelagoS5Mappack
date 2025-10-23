
-- Have freed keymaster after quest was started
createBriefingTrader2Paid = function()

	briefingTrader2Paid = 	{}	

	briefingTrader2Paid.finished = BriefingTrader2Paid

	local page = 0

	--	page
	
		page = page +1
	
		briefingTrader2Paid[page] 					= 	{}
		briefingTrader2Paid[page].title				= 	String.Key("briefingTrader2[1].title")
		briefingTrader2Paid[page].text				=	String.Key("briefingTrader2Paid[1].text")
		briefingTrader2Paid[page].position			=	GetPosition("traderDeployStart2")
		briefingTrader2Paid[page].explore			=	1500			

		StartBriefing(briefingTrader2Paid)

	end
	
	
	
	
BriefingTrader2Paid = function()

	ResolveBriefing(briefingTrader2Paid[1])

	end	
	

