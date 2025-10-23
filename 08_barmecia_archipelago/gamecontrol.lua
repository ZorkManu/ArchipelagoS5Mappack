-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	Restablish Trade Routes
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()
	Report("start 1st quest")
	--	briefing
	createQuestMeetMarket1()
	createBriefingPrelude()
	createQuestMeetMarket2()
	createQuestDefeat()
	createQuestReachBarmecia()
	createQuestReachCleycourt()
	
	local Route4APos = GetPosition("Route4A")
	local Trader1 = Logic.CreateEntity(Entities.PU_Travelling_Salesman, Route4APos.X, Route4APos.Y, 0, gvMission.PlayerIDBarmecia)
	Logic.SetEntityName(Trader1, "Route4Trader")
	if WalkCallback == nil then
		WalkCallback = {}
	end
 	WalkCallback["WalkToRoute4A"] = WalkToRoute4A
	WalkCallback["WalkToRoute4B"] = WalkToRoute4B
	WalkToRoute4B()
	
	start2ndQuest()
end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()
	Report("end 1st quest")
	local Route2APos = GetPosition("Route2A")
	local Trader1 = Logic.CreateEntity(Entities.PU_Travelling_Salesman, Route2APos.X, Route2APos.Y, 0, gvMission.PlayerIDBarmecia)
	Logic.SetEntityName(Trader1, "Route2Trader")
	if WalkCallback == nil then
		WalkCallback = {}
	end
 	WalkCallback["WalkToRoute2A"] = WalkToRoute2A
	WalkCallback["WalkToRoute2B"] = WalkToRoute2B
	WalkToRoute2B()
	start4thQuest()
end	

-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
	Report("start 2nd quest")
	createQuestMarket1Rescue()
end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()
  TradeRoute1Established = 1
  
  if WalkCallback == nil then
		WalkCallback = {}
	end
 	WalkCallback["WalkToRoute1A"] = WalkToRoute1A
	WalkCallback["WalkToRoute1B"] = WalkToRoute1B
	WalkCallback["WaitAt1A"] = WaitAt1A
	WalkToRoute1B()
  
  Report("End 2nd quest")
  ResolveBriefing(BriefingTraderFreed[1])
	ResolveBriefing(BriefingKidnapperQuest)
	if(TradeRoute2Established == 1)	then
		end1stQuest()
	end
end	

-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()
	Report("start 3rd quest")
	createQuestBuildMarket2()
end

-------------------------------------------------------------------------------------------------------------------------
	
end3rdQuest = function()
	TradeRoute2Established = 1
	Report("End 3rd quest")
	local Route3APos = GetPosition("Route3A")
	local Trader1 = Logic.CreateEntity(Entities.PU_Travelling_Salesman, Route3APos.X, Route3APos.Y, 0, gvMission.PlayerIDBarmecia)
	Logic.SetEntityName(Trader1, "Route3Trader")
	if WalkCallback == nil then
		WalkCallback = {}
	end
 	WalkCallback["WalkToRoute3A"] = WalkToRoute3A
	WalkCallback["WalkToRoute3B"] = WalkToRoute3B
	WalkToRoute3B()
	
	
	ResolveBriefing(PreludeMarketEast)
	ResolveBriefing(BriefingBuildMarketQuest)
	if(TradeRoute1Established == 1)	then
		end1stQuest()
	end
end	

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

start4thQuest = function()
	Report("start 4th quest")
	createQuestMainquest()
end

-------------------------------------------------------------------------------------------------------------------------
	
end4thQuest = function()
	ResolveBriefing(BriefingQuestDeliverStone)
	StartCutscene("CutsceneComplete", Victory)
	checkLocation("barmecia_victory")
end	

-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)
	if IsBriefingActive() then
			return
		end

	-- Hero is talking to build up npc
	if _npcId == GetID("TraderNPC2") then
		-- already done
		if talkedToMarket2Merchant == nil then

			start3rdQuest()
			DisableNpcMarker("TraderNPC2")
			talkedToMarket2Merchant = true
		end
	elseif _npcId == GetID("Market1NPC") then
		-- already done
		if talkedToMarket1NPC ~= 1 then
			Report("Talked to NPC")
			if(Trader1Freed ~= 1) then
				Report("Robbers were not defeated before")
				createBriefingMarket1Rescue()
			end
			talkedToMarket1NPC = 1
		end
	elseif _npcId == GetID("PilgrimNPC") then
		-- already done
		if talkedToPilgrim == nil then
			Report("Talked to NPC")
			createQuestBuildSulfurMine()
			talkedToPilgrim = true
		end
	end
end



WalkToRoute1B = function()
	local Route1APos = GetPosition("Route1A")
	local Trader1 = Logic.CreateEntity(Entities.PU_Travelling_Salesman, Route1APos.X, Route1APos.Y, 0, gvMission.PlayerIDBarmecia)
	Logic.SetEntityName(Trader1, "Route1Trader")
	Move("Route1Trader" ,GetPosition("Route1B"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route1B", "Route1Trader"},
									{"WalkToRoute1A"})
end

WalkToRoute1A = function()
	Move("Route1Trader" ,GetPosition("Route1A"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route1A", "Route1Trader"},
									{"WaitAt1A"})
end

WaitAt1A = function()
	DestroyEntity("Route1Trader")
	StartJob("WaitForMerchantReappear")
end

Condition_WaitForMerchantReappear = function()
	return Counter.Tick2("Merchant1", 20)
end


Action_WaitForMerchantReappear = function()
	WalkToRoute1B()
	return true
end


WalkToRoute2B = function()
	Move("Route2Trader" ,GetPosition("Route2B"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route2B", "Route2Trader"},
									{"WalkToRoute2A"})
end


WalkToRoute2A = function()

	Move("Route2Trader" ,GetPosition("Route2A"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route2A", "Route2Trader"},
									{"WalkToRoute2B"})
end

WalkToRoute3B = function()
	Move("Route3Trader" ,GetPosition("Route3B"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route3B", "Route3Trader"},
									{"WalkToRoute3A"})
end

WalkToRoute3A = function()

	Move("Route3Trader" ,GetPosition("Route3A"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route3A", "Route3Trader"},
									{"WalkToRoute3B"})
end

WalkToRoute4B = function()
	Move("Route4Trader" ,GetPosition("Route4B"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route4B", "Route4Trader"},
									{"WalkToRoute4A"})
end

WalkToRoute4A = function()

	Move("Route4Trader" ,GetPosition("Route4A"))
	Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND, 
									"Condition_IsAtPosition", 
									"Action_IsAtPosition", 
									1,
									{"Route4A", "Route4Trader"},
									{"WalkToRoute4B"})
end


Condition_IsAtPosition = function(_Position, _Trader)
	return Logic.CheckEntitiesDistance(GetID(_Position), GetID(_Trader), 300) == 1
end

Action_IsAtPosition = function(_Callback)
	WalkCallback[_Callback]()
	return true
end