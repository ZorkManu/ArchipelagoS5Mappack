createBriefingWarning = function()

	BriefingWarning = 	{}	

	BriefingWarning.finished = BriefingWarningFinished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingWarning[page] 					= 	{}
	BriefingWarning[page].title				=	String.GenericKey("Serf")
	BriefingWarning[page].text				=	String.Key("BriefingWarning1.text")

	if talkedToWarning1 == true then
			Report ("Warning1")
			BriefingWarning[page].position 			= 	GetPosition("Warning1")
			BriefingWarning[page].explore			=	3000

		else
			Report ("Warning2")
			BriefingWarning[page].position 			= 	GetPosition("Warning2")
			BriefingWarning[page].explore			=	3000

		end
		
	
   	
   	
	--	page 2
	
	page = page +1

	BriefingWarning[page] 					= 	{}
	BriefingWarning[page].title				=	String.GenericKey("Serf")
	BriefingWarning[page].text				=	String.Key("BriefingWarning2.text")
	BriefingWarning[page].position 			= 	GetPosition("WarningPos")
	BriefingWarning[page].explore			=	2000


	--	page 3
	
	page = page +1

	BriefingWarning[page] 					= 	{}
	BriefingWarning[page].title				=	String.GenericKey("Serf")
	BriefingWarning[page].text				=	String.Key("BriefingWarning3.text")
	BriefingWarning[page].position 			= 	GetPosition("WarningPos")


	-- nur wenn noch nicht mit den Vanlowern gesprochen
if	(talkedToTrader1 == nil) and (talkedToTrader2 == nil)
	then
		--	page 4
		
		page = page +1
	
		BriefingWarning[page] 					= 	{}
		BriefingWarning[page].title				=	String.GenericKey("Serf")
		BriefingWarning[page].text				=	String.Key("BriefingWarning4.text")
		BriefingWarning[page].position 			= 	GetPosition("Trader1")
		BriefingWarning[page].explore			=	2000
	
		--	page 5
		
		page = page +1
	
		BriefingWarning[page] 					= 	{}
		BriefingWarning[page].title				=	String.GenericKey("Serf")
		BriefingWarning[page].text				=	String.Key("BriefingWarning5.text")
		BriefingWarning[page].position 			= 	GetPosition("Trader2")
		BriefingWarning[page].explore			=	2000

	end
		
		page = page +1
	
		BriefingWarning[page] 					= 	{}
		BriefingWarning[page].title				=	String.GenericKey("Serf")
		BriefingWarning[page].text				=	String.Key("BriefingWarning6.text")
		BriefingWarning[page].position 	= 	{}
		BriefingWarning[page].position.X,
		BriefingWarning[page].position.Y 	= 	Camera.ScrollGetLookAt()

	--	go!
	
	StartBriefing(BriefingWarning)


end

BriefingWarningFinished = function()

	BriefingWarning.Warning1 = GetID("Warning1")
	MoveAndVanish(BriefingWarning.Warning1,"WarningExit")
	BriefingWarning.Warning2 = GetID("Warning2")
	MoveAndVanish(BriefingWarning.Warning2,"WarningExit")


	DisableNpcMarker("Warning1")
	DisableNpcMarker("Warning2")
	
	-- Remove exploration
ResolveBriefing(BriefingWarning[1])
ResolveBriefing(BriefingWarning[2])

end