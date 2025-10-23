createBriefingTributePaid = function()
		Report("TributePaid?")

		BriefingTributePaid = 	{}	

		local page = 0

		BriefingTributePaid.finished = BriefingTributePaidFinished

	--	page 1
	
		page = page +1
	
		BriefingTributePaid[page] 					= 	{}
		BriefingTributePaid[page].title				= 	String.Key("BriefingTributePaid.title")
 		BriefingTributePaid[page].text				=	String.Key("BriefingTributePaid.text")
		BriefingTributePaid[page].position 			= 	GetPosition("major")
		BriefingTributePaid[page].explore			=	6000	


	--	go!

		StartBriefing(BriefingTributePaid)

end

BriefingTributePaidFinished = function()

		-- Disable NPC and send back to hq
--		DisableNpcMarker("CountessSerf")
		-- Stop looking and following heros
--		SetNPCLookAtTarget("CountessSerf",0)
--		SetNPCFollow("CountessSerf", nil)

--		Move("CountessSerf","CountessHQ")
	

		-- Clear exploration of hq
		ResolveBriefing(BriefingTributePaid[1])

end
