createBriefingSwampNPC = function()
 BriefingSwampNPC = {}

	--	create refugee
	
		BriefingSwampNPC.finished = BriefingSwampNPCFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		BriefingSwampNPC[page] 					= 	{}
		BriefingSwampNPC[page].title				= 	String.GenericKey("Farmer")
		BriefingSwampNPC[page].text				=	String.Key("BriefingSwampNPC[1].text")
		BriefingSwampNPC[page].position		= GetPosition("SwampNPC")
				

	--	page 

	
		StartBriefing(BriefingSwampNPC)
end

BriefingSwampNPCFinished = function()
	DisableNpcMarker("SwampNPC")
end