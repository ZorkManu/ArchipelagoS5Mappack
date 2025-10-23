createBriefingGate = function()

	BriefingGate = 	{}	

	BriefingGate.finished = BriefingGateFinished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingGate[page] 					= 	{}
	BriefingGate[page].title				=	String.GenericKey("Serf")
	BriefingGate[page].text				=	String.Key("BriefingGate1.text")
	BriefingGate[page].position 			= 	GetPosition("GateNPC")

	--	page 2
	
	page = page +1

	BriefingGate[page] 					= 	{}
	BriefingGate[page].title				=	String.GenericKey("Serf")
	BriefingGate[page].text				=	String.Key("BriefingGate2.text")
	BriefingGate[page].position 			= 	GetPosition("GateNPC")


	--	page 3
	
	page = page +1

	BriefingGate[page] 					= 	{}
	BriefingGate[page].title				=	String.GenericKey("Serf")
	BriefingGate[page].text				=	String.Key("BriefingGate3.text")
	BriefingGate[page].position 			= 	GetPosition("GateToVillage")
	BriefingGate[page].explore			=	2000

	--	page 4
	
	page = page +1

	BriefingGate[page] 					= 	{}
	BriefingGate[page].title				=	String.GenericKey("Serf")
	BriefingGate[page].text				=	String.Key("BriefingGate4.text")
	BriefingGate[page].position 			= 	GetPosition("GateHQ")
	BriefingGate[page].explore			=	2000

	--	go!
	
	StartBriefing(BriefingGate)


end

BriefingGateFinished = function()

	BriefingGate.GateNPC = GetID("GateNPC")
	MoveAndVanish(BriefingGate.GateNPC,"Major")


	DisableNpcMarker("GateNPC")
	
	-- Remove exploration
	ResolveBriefing(BriefingGate[3])
end