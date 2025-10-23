createBriefingTrader2End = function()

	BriefingTrader2End = 	{}	

	BriefingTrader2End.finished = BriefingTrader2EndFinished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingTrader2End[page] 					= 	{}
	BriefingTrader2End[page].title				=	String.Key("BriefingTrader2.title")
	BriefingTrader2End[page].text				=	String.Key("BriefingTrader2End1.text")
	BriefingTrader2End[page].position 			= 	GetPosition("Trader2")
   	
	--	page 2
	
	page = page +1

	BriefingTrader2End[page] 					= 	{}
	BriefingTrader2End[page].title				=	String.Key("BriefingTrader2.title")
	BriefingTrader2End[page].text				=	String.Key("BriefingTrader2end2.text")




	--	go!
	
	StartBriefing(BriefingTrader2End)

	StartJob("DelayTrader2")

end

BriefingTrader2EndFinished = function()

end

Condition_DelayTrader2 = function()
	return  Counter.Tick2("Dummy", 10)
end

Action_DelayTrader2 = function()

		local Trader2 = GetID("Trader2")
		MoveAndVanish(Trader2,"WarningExit")
	
	return true
end