createBriefingDestroyRedDone = function()

		BriefingDestroyRedDone = 	{}	

		local page = 0

		BriefingDestroyRedDone.finished = BriefingDestroyRedDoneFinished

	--	page 1
	
		page = page +1
	
		BriefingDestroyRedDone[page] 					= 	{}
		BriefingDestroyRedDone[page].title				= 	String.Key("BriefingDestroyRedDone.title")
 		BriefingDestroyRedDone[page].text				=	String.Key("BriefingDestroyRedDone.text")
		BriefingDestroyRedDone[page].position 			= 	GetPosition("DestroyRed2")
		BriefingDestroyRedDone[page].explore			=	1000	

	--	go!
	
		StartBriefing(BriefingDestroyRedDone)
end

BriefingDestroyRedDoneFinished = function()

		-- Disable NPC and send back to hq
--		DisableNpcMarker("CountessSerf")
		-- Stop looking and following heros
--		SetNPCLookAtTarget("CountessSerf",0)
--		SetNPCFollow("CountessSerf", nil)

--		Move("CountessSerf","CountessHQ")
	

		-- Clear exploration of hq
		ResolveBriefing(BriefingDestroyRedDone[1])

end
