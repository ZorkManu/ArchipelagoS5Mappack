createBriefingTrader2 = function()

	BriefingTrader2 = 	{}	

	BriefingTrader2.finished = BriefingTrader2Finished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingTrader2[page] 					= 	{}
	BriefingTrader2[page].title				=	String.Key("BriefingTrader2.title")
	BriefingTrader2[page].text				=	String.Key("BriefingTrader2_1.text")
	BriefingTrader2[page].position 			= 	GetPosition("Trader2")
   	
	--	page 2
	
	page = page +1

	BriefingTrader2[page] 					= 	{}
	BriefingTrader2[page].title				=	String.Key("BriefingTrader2.title")
	BriefingTrader2[page].text				=	String.Key("BriefingTrader2_2.text")



	--	page 3
	
	page = page +1

	BriefingTrader2[page] 					= 	{}
	BriefingTrader2[page].title				=	String.Key("BriefingTrader2.title")
	BriefingTrader2[page].text				=	String.Key("BriefingTrader2_3.text")



	--	go!
	
	StartBriefing(BriefingTrader2)


end

BriefingTrader2Finished = function()

	DisableNpcMarker("Trader2")
	start11thQuest()

end