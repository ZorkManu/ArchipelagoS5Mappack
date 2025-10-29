-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	Destroy enemies (village raiders)
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

	StartJob("ControlDefeat")

	-- Create NPCs	TF_Include!
		InitMapNPCs() 					--MapLocal_CreateNPCs()
 

	--	ai

		createArmyVillageRaiders()		-- village attackers; also includes first quest!

		createArmyBigBoss()				-- defenders of robbers camp

		--		createArmyBanditGroups()		--TF: nicht aktiv!


	-- make houses and serfs un-selectable, move serfs

			for i = 0, 5, 1 do
			
				if IsAlive("Destroy"..i) then
					local house = Logic.GetEntityIDByName("Destroy"..i)
					Logic.SetEntitySelectableFlag(house, 0)
					Logic.SetEntityUserControlFlag(house, 0)
				end
		
				if IsAlive("serf"..i) then
					SetHealth("serf"..i, 20)
					Move("serf"..i, "serfTarget"..i)
				end
	
				if IsAlive("House"..i) then
					local house = Logic.GetEntityIDByName("House"..i)
					Logic.SetEntitySelectableFlag(house, 0)
					Logic.SetEntityUserControlFlag(house, 0)
				end
			end
	
			--if IsAlive("castle") then
				--local house = Logic.GetEntityIDByName("castle")
				--Logic.SetEntitySelectableFlag(house, 0)
				--Logic.SetEntityUserControlFlag(house, 0)
			--end
	
	
		--	burning village
		
			SetHealth("Destroy1",80)
			SetHealth("Destroy2",60)
			SetHealth("House1",45)
			SetHealth("House2",40)


	--	briefing

		createBriefingPrelude()

		
	--	quests
	
		createQuestMerchant()

		createQuestRescueKeymaster()

		createQuestGate()
		
	end


-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	MakeVulnerable("firstRefugee")

	ResolveBriefing(briefingPrelude[1])

	ResolveBriefing(briefingPrelude[2])


	-- make houses and serfs selectable

		for i = 0, 5, 1 do
		
			if IsAlive("Destroy"..i) then
				SetHealth("Destroy"..i, 0)
			end
	
			if IsAlive("House"..i) then
				local house = Logic.GetEntityIDByName("House"..i)
				Logic.SetEntitySelectableFlag(house, 1)
				Logic.SetEntityUserControlFlag(house, 1)
			end
		end

		if IsAlive("castle") then
			local house = Logic.GetEntityIDByName("castle")
			Logic.SetEntitySelectableFlag(house, 1)
			Logic.SetEntityUserControlFlag(house, 1)
		end

		--Archipelago Reward
		checkLocation("thalgrund_save_village")

	end	

-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	Talk to npc (move to the priest)
--
-------------------------------------------------------------------------------------------------------------------------

-- Goto Johannes
start2ndQuest = function()
				
	InitNPCLookAt("Johannes")

	Report("start 2nd quest")				
							
	--	briefing
	
		createBriefingPriest()

	end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()	

	Report("end 2nd quest")

	ResolveBriefing(briefingPriest[1])
	ResolveBriefing(briefingPriest[3])

	-- Enable Building of houses
	--AllowBuildings()

	--Archipelago Reward
	checkLocation("thalgrund_speak_with_priest")

	end
			
-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	Establish base (build barracks and university)
--
-------------------------------------------------------------------------------------------------------------------------

-- Quest build village	
start3rdQuest = function()
	
	Report("start 3rd quest")

	initConstantAttacker()
	
	--	enable sub quest npc

		InitNPCLookAt("NPC_Village2_2")
		InitNPCLookAt("Mayor_Archers")
		
	-- Funny NPCs

		InitNPCLookAt("NPC_River1")
		InitNPCLookAt("NPC_Waterfall1")

	--	briefing
	
		createEstablishBaseBriefing()
	
	--	expansion

		EnableExpanding(GetHumanPlayer())

	-- give start resources to player
		GlobalMissionScripting.GiveResouces(GetHumanPlayer(), StartResource.money, StartResource.clay, StartResource.wood, StartResource.stone)

		enableTechsOutOfGDB()

	--	quest		
		
		createQuestEstablishBase()
		
		createQuestLeonardo()

	end	

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()
	
	Report("end 3rd quest")
	
	ResolveBriefing(briefingEstablishBase[page_constructBarracks])

	--Archipelago Reward
	checkLocation("thalgrund_build_barracks")
	
	end
	
-------------------------------------------------------------------------------------------------------------------------
--
--					4th Quest:	Defend home base (destroy attacking army several times) and reach exit
--
-------------------------------------------------------------------------------------------------------------------------
	
start4thQuest = function()

	Report("start 4th quest")

	

	--	tower existing
	
		if IsAlive("Jail") then
		
		--	ai
	
			createArmyAttackingBandits()
			
		end

	--	briefing	
	
		if IsBriefingActive() ~= true then
	
			MapLocal_CameraPositionBackup()
	
			createBriefingAttackingBandits()
	
			createQuestReachArea()

		else

			MapBriefing_Started = StartJob("DelayBriefing")

		end
	
	end
	
	----------------------------------------------------------------
	Condition_DelayBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefing = function()                                  
	----------------------------------------------------------------
		                                                            
		MapLocal_CameraPositionBackup()
		createBriefingAttackingBandits()
		createQuestReachArea()

		EndJob(MapBriefing_Started)

	end
	
	
-------------------------------------------------------------------------------------------------------------------------
	
end4thQuest = function()
    
	Report("end 4th quest")
    
	ResolveBriefing(briefingAttackingBandits[page_gate])

	--	check if briefing is active
	if IsBriefingActive() ~= true then
		--Archipelago Reward
		checkLocation("thalgrund_victory")
		StartCutscene("MissionComplete", Victory)
	else
		Victory_Started = StartJob("DelayVictory")
	end
	
end
	
	----------------------------------------------------------------
	Condition_DelayVictory = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
			return true
		end
		return false
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayVictory = function()                                  
	----------------------------------------------------------------
		--Archipelago Reward
		checkLocation("thalgrund_victory")
		StartCutscene("MissionComplete", Victory)
		EndJob(Victory_Started)

	end

    
    
    
    
-------------------------------------------------------------------------------------------------------------------------
--  
--									1st Sub Quest:	Hire troops at Village red
--
-------------------------------------------------------------------------------------------------------------------------

questHireTroopsIsActive = false

start1stSubQuest = function()

	--	never restart this quest!

		if questHireTroopsIsActive == true then
			restart1stSubQuest()
			return
		end

	Report("start 1st sub quest")

	--	resolve "search friendly village" quest
	
		ResolveBriefing(briefingEstablishBase[page_searchFriendlyVillage])

	--	quest

		createQuestHireTroops()
		
	--	briefing
		
		createBriefingHireTroops()

	--	mark this quest as active

		questHireTroopsIsActive = true
	
end


restart1stSubQuest = function()

	SpokenMessage(String.MainKey.."_Hint_TradeMenu")

end
	

end1stSubQuest = function()
	
	DisableNpcMarker("NPC_Village2_2")
	
end	

-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Sub Quest:	Find ring.
--
-------------------------------------------------------------------------------------------------------------------------

start2ndSubQuest = function()

	Report("start 2nd sub quest")

	--	quest
	createQuestMiner()
	
end




end2ndSubQuest = function()
	
	DisableNpcMarker("MinerGiveRing")
	
	ResolveBriefing(briefingMiner[page_ring])

	-- give player Ironmine
		ChangePlayer("Ironmine",1)
		--Archipelago Reward
		checkLocation("thalgrund_ring_quest")
	
end	

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Sub Quest:	Hire archers at village violett
--
-------------------------------------------------------------------------------------------------------------------------

questArcher = false

start3rdSubQuest = function()

	--	never restart this quest!

		if questArcher == true then
		
			restart3stSubQuest()
			
			return
			
		end

	Report("start 3rd sub quest")

	--	briefing
		
		createBriefing2ndVillage()

	--	quest Violett viollet (get archers)

		createQuest2ndVillage()

	--	mark this quest as active

		questArcher = true
	
	end


restart3stSubQuest = function()

	SpokenMessage(String.MainKey.."_Hint_TradeMenu")

	end
	

end3rdSubQuest = function()

	DisableNpcMarker("Mayor_Archers")

	-- destroy minimap marker
		local x, y = Tools.GetPosition("Mayor_Archers")
		GUI.DestroyMinimapPulse(x, y)	

	
end	
	
-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	-- Ignore if running briefing

		if IsBriefingActive() then
			return
		end


	--	which hero is selected?
	
		if Logic.IsHero(_heroId) then

			if _npcId == GetEntityId("NPC_Forrest1") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

--					end3rdSubQuest()				
				
				end

			end
			
			-- Miner who searches ring
			if IsAlive("Miner") then
				if _npcId == GetEntityId("Miner") then
			
					if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
					
						createBriefingMiner()
						destroyQuestMiner()
					
					end
					
				end
			end				
				
			-- Miner who gets ring (the renamed "Miner")
			if IsAlive("MinerGiveRing") then
			
				if _npcId == GetEntityId("MinerGiveRing") then
				
					if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
					
						destroyQuestMinerGiveRing()
					
					end
					
				end
			end



			if _npcId == GetEntityId("Johannes") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then		
				
					end2ndQuest()
				
					start3rdQuest()					
				
				end
							
			end
				
			if _npcId == GetEntityId("NPC_Village2_2") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				
					start1stSubQuest()
					
				end
			
			end
				
				
			if _npcId == GetEntityId("Mayor_Archers") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				
					start3rdSubQuest()				
					
				end
			
			end

			if _npcId == GetEntityId("NPC_Market1") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

					createBriefingMerchant()
				
					destroyQuestMerchant()					

				end
						
			end


			if _npcId == GetEntityId("Leonardo") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

					StartCutscene("Leonardo")

--					createBriefingLeonardo()
					destroyQuestLeonardo()
					
				end
			
			end
		
			
			
			-- NPC waterfall
			if _npcId == GetEntityId("NPC_Waterfall1") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

				    StartCutscene("Waterfall")
					
				end
			
			end
		

			-- NPC river
			if _npcId == GetEntityId("NPC_River1") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

					createBriefingNPCRiver1()
					
				end
			
			end
		

	----------------------------------------------------------------------------------------
	--	Tipp-giving NPCs without quests; TF_include

		MapLocal_npcCheck(_heroId,_npcId)

	----------------------------------------------------------------------------------------
		end

	end
	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlDefeat"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlDefeat = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead("castle")	then 
			
			return true
			
			end
			
		return false
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlDefeat = function()
	-------------------------------------------------------------------------------------------------------------------

		Defeat()		

		return true
		
		end
