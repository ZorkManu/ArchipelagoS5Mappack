-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	talk to barmecia
--
-------------------------------------------------------------------------------------------------------------------------

MOVING_AROUND = 0
NEAR_MACHINE = 2
-- Counter f�rs Ausflippen von Leonardo
talkedToLeonardoSeaching = 0
criticalMass = 20


start1stQuest = function()
--	SpokenMessage("start 1st quest")
--	Tor von Beginn an schliessen:
--	ReplaceEntity("AriGate1", Entities.XD_PalisadeGate1)

--	SpokenMessage("start 1st quest")

	-- Enable BuildUpNPC
	InitNPC("BarmeciaMayor")
	SetNPCLookAtTarget("BarmeciaMayor",1)
	EnableNpcMarker("BarmeciaMayor")
	
	EnableNpcMarker("Warning1")
	EnableNpcMarker("Warning2")
	EnableNpcMarker("Trader1")
	EnableNpcMarker("Trader2")
	EnableNpcMarker("CleycourtGuard1")
	EnableNpcMarker("BarmeciaGuard1")
	EnableNpcMarker("GuardWaterfall")

	--	ai
	
	createPlayer1()
	createPlayer3()
	createPlayer4()
	createPlayer7()
	
	--	briefing

	StartCutscene("Intro",createBriefingPrelude)
--	createBriefingPrelude()
	
	--	quests
	
	createQuestReachBarmeciaMayor()
	createQuestDefeat()

	StartJob("QuestNearGateNoKey")
	
	start2ndQuest()
	start3rdQuest()
	start4thQuest()

	LeoState = MOVING_AROUND

end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")
	checkLocation("cleycourt_reach_barmecia")
--	StartBinkVideo("02_VillageAttack1")
	ResolveBriefing(MeetBarmeciaPage)
	
			Logic.SetQuestType(
			1, 					
			5,
			MAINQUEST_OPEN +1,
			1
		)
 
       DestroyEntity("BlockWaterfall")

	local NPC = GetID("GuardWaterfall")
	MoveAndVanish(NPC,"WarningExit")
	DisableNpcMarker("GuardWaterfall")

	start5thQuest()

end	

-------------------------------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	find ari
--
-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
				
	Report("start 2nd quest")				
			
	--	quests
	
	createQuestFindAri()

end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()	

	Report("end 2nd quest")
	StartCutscene("Cutscene3")

	--	Ari flees
	SetPosition("Ari", GetPosition("AriBack"))
	Logic.EntityLookAt("Ari","BarmeciaMovePoint2")

	SetPosition("AriLeader1", GetPosition("AriBackLeader1"))
	SetPosition("AriLeader2", GetPosition("AriBackLeader2"))
	SetPosition("AriLeader3", GetPosition("AriBackLeader3"))
	SetPosition("AriLeader4", GetPosition("AriBackLeader4"))
	SetPosition("AriLeader5", GetPosition("AriBackLeader5"))

	Logic.EntityLookAt("AriLeader1","AriCampFire")
	Logic.EntityLookAt("AriLeader2","AriCampFire")
	Logic.EntityLookAt("AriLeader3","AriCampFire")
	Logic.EntityLookAt("AriLeader4","AriCampFire")
	Logic.EntityLookAt("AriLeader5","AriCampFire")
	
--	ReplaceEntity("AriGate1", Entities.XD_PalisadeGate1)
	
	--	Any key page
	if	FindAriPage ~= nil then
		ResolveBriefing(FindAriPage)
	end
	
		
	AriFleed = true
end
			

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	free chest
--
-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()

	Report("start 3rd quest")

	--	quests
	
	createQuestFreeChest()

end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()	

	Report("end 3rd quest")
	
	-- Spawn chest
	CreateEntity(3,	Entities.XD_ChestClose, GetPosition("ChestPos"), "Chest")
	
	start8thQuest()

end


-------------------------------------------------------------------------------------------------------------------------
--
--									4th Quest:	Leo move near machine
--
-------------------------------------------------------------------------------------------------------------------------


start4thQuest = function()

	Report("start 4th quest")

	--	quests
	
	createQuestLeoMoveNearMachine()
	
end

-------------------------------------------------------------------------------------------------------------------------

end4thQuest = function()	

	Report("end 4th quest")
	
end


-------------------------------------------------------------------------------------------------------------------------
--
--									5th Quest:	catch ari
--
-------------------------------------------------------------------------------------------------------------------------


start5thQuest = function()

	Report("start 5th quest")

	-- 	briefing
	
--	StartCutscene("Cutscene1",createBriefingCatchAri)
	createBriefingCatchAri()

	--	quests
	
	createQuestCatchAri()

end

-------------------------------------------------------------------------------------------------------------------------

end5thQuest = function()	

	Report("end 5th quest")

	ResolveBriefing(CatchAriPage)
	
	
	-- Cutscene and start 6th quest after
	ReplaceEntity("AriGate2", Entities.XD_PalisadeGate2)
	checkLocation("cleycourt_capture_ari")
	
	start6thQuest()	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									6th Quest:	build uni
--
-------------------------------------------------------------------------------------------------------------------------


start6thQuest = function()

	Report("start 6th quest")

	--	briefing
	DestroyEntity("UniBlocker1")
	DestroyEntity("UniBlocker2")
	
	StartCutscene("Cutscene4",createBriefingUni)
	DestroyEntity("Ari")

--	createBriefingUni()

	--	quests
	
	createQuestBuildUni()

end

-------------------------------------------------------------------------------------------------------------------------

end6thQuest = function()	

	checkLocation("cleycourt_build_uni")

	Report("end 6th quest")

	ResolveBriefing(BuildUniPage)
	
	local PosX,PosY = Tools.GetPosition("CheckUniversity")
	local Count, ID = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_University1, PosX, PosY, 1500, 1)
	Logic.SetEntityName(ID, "Uni")
	ChangePlayer(ID, 3)
	
	start7thQuest()	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									7th Quest:	weather machine
--
-------------------------------------------------------------------------------------------------------------------------


start7thQuest = function()

	Report("start 7th quest")

	--	briefing
	
	createBriefingOrb()

	-- Move leo near weather machine

	MoveLeoNearMachine()

	OrbAnalyzed	=	true
end

-------------------------------------------------------------------------------------------------------------------------

end7thQuest = function()	

	Report("end 7th quest")

	ResolveBriefing(MachinePage)

	StartBinkVideo("Cleycourt")

	-- Cutscene and victory
	Logic.AddWeatherElement(2, 100000, 0, 2, 2, 5)

	StartCutscene("CutsceneComplete")

	checkLocation("cleycourt_victory")

	Victory()
end


-------------------------------------------------------------------------------------------------------------------------
--
--									8th Quest:	Get key
--
-------------------------------------------------------------------------------------------------------------------------


start8thQuest = function()

	Report("start 8th quest")

	--	briefing
	
	createQuestGetKey()
	
end

-------------------------------------------------------------------------------------------------------------------------

end8thSubQuest = function()	

	Report("end 8th quest")

	ReplaceEntity("Chest", Entities.XD_ChestOpen)

	--	Briefing
	
	createBriefingAriBase()

	ResolveBriefing(GetKeyPage)

	start9thQuest()
		
end

-------------------------------------------------------------------------------------------------------------------------
--
--									9th Quest:	Open Gates
--
-------------------------------------------------------------------------------------------------------------------------

start9thQuest = function()

	Report("start 9th quest")
	
	--	Open Gate quest
	createQuestOpenGates()

end

-------------------------------------------------------------------------------------------------------------------------

end9thSubQuest = function()	

	Report("end 9th quest")

	ResolveBriefing(GatePage)

end

-------------------------------------------------------------------------------------------------------------------------
--
--									10th Subquest:	Trader1
--
-------------------------------------------------------------------------------------------------------------------------


start10thQuest = function()

	Report("start 10th quest")

	--	briefing
	
	createQuestTrader1()
	
end

-------------------------------------------------------------------------------------------------------------------------

end10thSubQuest = function()	

	Report("end 10th quest")

		
end

-------------------------------------------------------------------------------------------------------------------------
--
--									11th Subquest:	Trader2
--
-------------------------------------------------------------------------------------------------------------------------


start11thQuest = function()

	Report("start 11th quest")

	--	briefing
	
	createQuestTrader2()
	
end

-------------------------------------------------------------------------------------------------------------------------

end11thSubQuest = function()	

	Report("end 11th quest")

		
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

	-- Hero is talking to build up npc
	if _npcId == GetID("Leonardo") then

		-- already done
		if talkedToLeonardo == nil then

			if LeoState == MOVING_AROUND then
			
				talkedToLeonardoSeaching = talkedToLeonardoSeaching + 1
				
				
				if talkedToLeonardoSeaching > criticalMass then

					local randomText = Logic.GetRandom(5) + 1
						if randomText == 1 then
							SpokenMessage( String.MainKey.."LeonardoAngry1")
						elseif randomText == 2 then
							SpokenMessage( String.MainKey.."LeonardoAngry2")
						elseif randomText == 3 then
							SpokenMessage( String.MainKey.."LeonardoAngry3")
						elseif randomText == 4 then
							SpokenMessage( String.MainKey.."LeonardoAngry4")
						elseif randomText == 5 then
							SpokenMessage( String.MainKey.."LeonardoAngry5")
						else
							SpokenMessage( String.MainKey.."LeonardoAngry1")
						end

				elseif talkedToLeonardoSeaching < criticalMass then
				
					local randomText = Logic.GetRandom(5) + 1
						if randomText == 1 then
							SpokenMessage( String.MainKey.."LeonardoRandom1")
						elseif randomText == 2 then
							SpokenMessage( String.MainKey.."LeonardoRandom2")
						elseif randomText == 3 then
							SpokenMessage( String.MainKey.."LeonardoRandom3")
						elseif randomText == 4 then
							SpokenMessage( String.MainKey.."LeonardoRandom4")
						elseif randomText == 5 then
							SpokenMessage( String.MainKey.."LeonardoRandom5")
						else
							SpokenMessage( String.MainKey.."LeonardoRandom1")
						end
				elseif talkedToLeonardoSeaching == criticalMass then
				
						SpokenMessage( String.MainKey.."LeonardoAngryPrelude")

				end
						
					
			elseif LeoState == NEAR_MACHINE then
				
				if OrbAnalyzed == nil then
					createBriefingLeonardo()
				else
					end7thQuest()
				end
					
				talkedToLeonardo = true

			end
			
		end
		
	elseif _npcId == GetID("BarmeciaMayor") then	

		-- already done
		if talkedToBarmeciaMayor == nil then

			end1stQuest()
			
			talkedToBarmeciaMayor = true
		end

	elseif _npcId == GetID("Warning1") then	

		-- already done
		if talkedToWarning1 == nil then

			talkedToWarning1 = true
			createBriefingWarning()
		end
		
	elseif _npcId == GetID("Warning2") then	

		-- already done
		if talkedToWarning1 == nil then

			talkedToWarning2 = true
			createBriefingWarning()
		end

	elseif _npcId == GetID("Trader1") then	

		-- already done
		if talkedToTrader1 == nil then

			createBriefingTrader1()
			talkedToTrader1 = true
		end
	
	elseif _npcId == GetID("Trader2") then	

		-- already done
		if talkedToTrader2 == nil then

			createBriefingTrader2()
			talkedToTrader2 = true
		end
	
	elseif _npcId == GetID("CleycourtGuard1") then	

		-- already done
		if talkedToCleycourtGuard1 == nil then

			StartCutscene("Cutscene2")
			talkedToCleycourtGuard1 = true
			DisableNpcMarker("CleycourtGuard1")
	
		end	
		
	elseif _npcId == GetID("BarmeciaGuard1") then	

		-- already done
		if talkedToBarmeciaGuard1 == nil then

			StartCutscene("Cutscene1")
			talkedToBarmeciaGuard1 = true
			DisableNpcMarker("BarmeciaGuard1")
	
		end
		
	elseif _npcId == GetID("GuardWaterfall") then	

		-- already done
		if talkedToGuardWaterfall == nil then

			createBriefingGuardWaterfall()
			talkedToGuardWaterfall = true
			DisableNpcMarker("GuardWaterfall")
	
		end
	
			
		
		
	end

end