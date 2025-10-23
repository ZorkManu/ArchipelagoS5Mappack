createBriefingTrader1End = function()

	BriefingTrader1End = 	{}	

	BriefingTrader1End.finished = BriefingTrader1EndFinished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingTrader1End[page] 					= 	{}
	BriefingTrader1End[page].title				=	String.Key("BriefingTrader1.title")
	BriefingTrader1End[page].text				=	String.Key("BriefingTrader1End1.text")
	BriefingTrader1End[page].position 			= 	GetPosition("Trader1")
   	
	--	page 2
	
	page = page +1

	BriefingTrader1End[page] 					= 	{}
	BriefingTrader1End[page].title				=	String.Key("BriefingTrader1.title")
	BriefingTrader1End[page].text				=	String.Key("BriefingTrader1end2.text")




	--	go!
	
	StartBriefing(BriefingTrader1End)

	StartJob("Delay")

end

BriefingTrader1EndFinished = function()

end

Condition_Delay = function()
	return  Counter.Tick2("Dummy", 10)
end

Action_Delay = function()

		local Trader1 = GetID("Trader1")
		MoveAndVanish(Trader1,"WarningExit")
	
	return true
end