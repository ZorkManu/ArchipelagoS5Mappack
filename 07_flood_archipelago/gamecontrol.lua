-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Move to Leo
--
-------------------------------------------------------------------------------------------------------------------------

startQuestMoveToLeo = function()
	Report("start quest: move to leo")
		TalkToLeoQuestIsActive = false
		AriInCleyCourt = false
		tributeAmount = 1000
		EntryCounter = 0
	--	briefing
	
	
		StartCutscene("Intro", createBriefingPrelude)
--		createBriefingPrelude()

	--	quest

		createQuestLeo()	
		createQuestDefeat()
		StartJob("QuestEnterCleycourtForbidden")	


	--	ai
		
		createArmyAttack1()
		createArmyAttack2()
		createArmyAttack3()
		createArmyBandits()
		
		createArmyCleycourtPatrol()
		createArmyBarmeciaDefenders()
		
	--	misc

	end

-------------------------------------------------------------------------------------------------------------------------
	
endQuestMoveToLeo = function()

	ResolveBriefing(briefingPrelude[page_Leo])

	end
	
-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	if Logic.IsHero(_heroId) and IsBriefingActive() == false then

		if _npcId == GetEntityId("Leo") then

			destroyQuestLeo()

			endQuestMoveToLeo()

			end	

		if _npcId == GetEntityId("merchant1") then

			SetupTributeMerchant1()

			createBriefingMerchant1()
			
			DisableNpcMarker("merchant1")
		
			end

		if _npcId == GetEntityId("merchant2") then
		
			SetupTributeMerchant2()

			createBriefingMerchant2()
		
			DisableNpcMarker("merchant2")
		
			end
		
		if _npcId == GetEntityId("merchant3") then

			Report("bla")
--			Break()

			if IsDead("Ari") == false and GetEntityId("Ari") == _heroId and ariHasTheKey == true then
	
				ResolveBriefing(briefingMerchant3[page_Key])
				createBriefingKey()
--				ResolveBriefing(briefingChestFound[2])
				DisableNpcMarker("merchant3")

				checkLocation("flood_hand_in_key")
				
				SetupTributeMerchant3()
				
			elseif IsDead("Ari") == false and GetEntityId("Ari") ~= _heroId and ariHasTheKey == true then
			
				SpokenMessage(String.MainKey.."Merchant3WantsAri.text")
										
		
			else
				
				if ariHasTheKey ~= true then	

					destroyQuestKey()
					
					createQuestSearchChest()

					Report("StartBriefingMerchant3")
					createBriefingMerchant3()

					StartJob("DelayCutscene1")
--					StartCutscene("Cutscene1",createBriefingMerchant3)

				else
				
					Report("Ari must talk with the npc!")

					end
		
				end	
				

			end
		
		end

	end
	
TributePaidmerchant1 = function()
Report("Tribute paid")
-- Tools.GiveResouces(_PlayerID, _gold, _clay,_wood, _stone,_iron,_sulfur)
	Tools.GiveResouces(1,0, tributeAmount,0,0,0,0)
	
end

TributePaidmerchant2 = function()
Report("Tribute paid")
-- Tools.GiveResouces(_PlayerID, _gold, _clay,_wood, _stone,_iron,_sulfur)
	Tools.GiveResouces(1, 0, 0,0,0,tributeAmount,0)
end

TributePaidmerchant3 = function()
Report("Tribute paid")
-- Tools.GiveResouces(_PlayerID, _gold, _clay,_wood, _stone,_iron,_sulfur)
	Tools.GiveResouces(1, 0, 0,0,0,0,tributeAmount*2)
end

SetupTributeMerchant1 = function()
			local job = {}
			
			job.Tribute = uniqueTributeCounter
			
			uniqueTributeCounter = uniqueTributeCounter +1
		
			Logic.AddTribute(	GetHumanPlayer(), 
								job.Tribute,
								0,
								0,
								"CM01_07_Flood/tribute005_BarmeciaTrader_Wood", 
								ResourceType.Wood, 
								tributeAmount/2 )
		
--			job.Resources 	= { cley = tributeAmount }
			job.Callback = TributePaidmerchant1
			
			SetupTributePaid(job)
end

SetupTributeMerchant2 = function()
			local job = {}
			
			job.Tribute = uniqueTributeCounter
			
			uniqueTributeCounter = uniqueTributeCounter +1
		
			Logic.AddTribute(	GetHumanPlayer(), 
								job.Tribute,
								0,
								0,
								"CM01_07_Flood/tribute006_BarmeciaTrader_Clay", 
								ResourceType.Clay, 
								tributeAmount/2 )
		
--			job.Resources 	= { iron = tributeAmount }
			job.Callback = TributePaidmerchant2
			SetupTributePaid(job)
end

SetupTributeMerchant3 = function()
				local job = {}
				
				job.Tribute = uniqueTributeCounter
				
				uniqueTributeCounter = uniqueTributeCounter +1
			
				Logic.AddTribute(	GetHumanPlayer(), 
									job.Tribute,
									0,
									0,
									"CM01_07_Flood/tribute007_BarmeciaTrader_Gold", 
									ResourceType.Gold, 
									tributeAmount )
			
--				job.Resources 	= { sulfur = tributeAmount*2 }
				job.Callback = TributePaidmerchant3
				SetupTributePaid(job)
end


Condition_DelayCutscene1 = function()
	if IsBriefingActive() ~= true then
		return true
	end

	return false
end                                                             


Action_DelayCutscene1 = function()

	StartCutscene("Cutscene1")
	return true

end

