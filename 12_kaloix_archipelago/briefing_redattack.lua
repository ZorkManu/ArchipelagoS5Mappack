createBriefingRedAttack = function()
		Report("RedAttack?")

		if RedAttackToggle == 0 then
			BriefingRedAttack = 	{}	

			local page = 0

			BriefingRedAttack.finished = BriefingRedAttackFinished

		--	page 1
		
			page = page +1
		
			BriefingRedAttack[page] 					= 	{}
			BriefingRedAttack[page].title				= 	String.Key("BriefingRedAttack.title")
	 		BriefingRedAttack[page].text				=	String.Key("BriefingRedAttack.text")
			BriefingRedAttack[page].position 			= 	GetPosition("KI2_Spot")
			BriefingRedAttack[page].explore			=	3000	
	
		--	page 2
		
			page = page +1
		
			BriefingRedAttack[page] 					= 	{}
			BriefingRedAttack[page].title				= 	String.Key("BriefingRedAttack2.title")
	 		BriefingRedAttack[page].text				=	String.Key("BriefingRedAttack2.text")
			BriefingRedAttack[page].position 			= 	GetPosition("KI2_Spot")

	
	
		--	go!

			Report("RedAttack!!!")
			StartBriefing(BriefingRedAttack)

		end
			
		RedAttackToggle = 1
end

BriefingRedAttackFinished = function()

		-- Disable NPC and send back to hq
--		DisableNpcMarker("CountessSerf")
		-- Stop looking and following heros
--		SetNPCLookAtTarget("CountessSerf",0)
--		SetNPCFollow("CountessSerf", nil)

--		Move("CountessSerf","CountessHQ")
	

		-- Clear exploration of hq
		ResolveBriefing(BriefingRedAttack[1])

end
