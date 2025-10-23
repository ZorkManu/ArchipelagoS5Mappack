createBriefingTrader1 = function()

	BriefingTrader1 = 	{}	

	BriefingTrader1.finished = BriefingTrader1Finished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingTrader1[page] 					= 	{}
	BriefingTrader1[page].title				=	String.Key("BriefingTrader1.title")
	BriefingTrader1[page].text				=	String.Key("BriefingTrader1.text")
	BriefingTrader1[page].position 			= 	GetPosition("Trader1")
   	
	--	page 2
	
	page = page +1

	BriefingTrader1[page] 					= 	{}
	BriefingTrader1[page].title				=	String.Key("BriefingTrader1.title")
	BriefingTrader1[page].text				=	String.Key("BriefingTrader2.text")



	--	page 3
	
	page = page +1

	BriefingTrader1[page] 					= 	{}
	BriefingTrader1[page].title				=	String.Key("BriefingTrader1.title")
	BriefingTrader1[page].text				=	String.Key("BriefingTrader3.text")



	--	go!
	
	StartBriefing(BriefingTrader1)


end

BriefingTrader1Finished = function()

	DisableNpcMarker("Trader1")
	start10thQuest()
	

end