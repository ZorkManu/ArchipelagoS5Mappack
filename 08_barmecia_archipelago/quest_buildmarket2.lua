createQuestBuildMarket2 = function()

	Logic.SetDiplomacyState( gvMission.PlayerIDTrader, gvMission.PlayerIDBarmecia, Diplomacy.Hostile )
		
	Logic.GroupAttack(gvMission.DestructionGroup, GetID("Trader2"))
	createBriefingBuildMarket()
	
	SetupMarket2Quest("Market2BuildPlace",Market2Build)
	SetupMarket2FirstStepQuest("Market2BuildPlace",Market2FirstStepBuild)
	
	local Tribute1 = {}
	
	Tribute1.Tribute = 3

	Logic.AddTribute(	GetHumanPlayer(), 
						Tribute1.Tribute,
						0,
						0,
						String.MainKey.."tribute_market2", 
						ResourceType.Gold, 
						1500 )

						
	Tribute1.Callback 	= TributePaid

	SetupTributePaid(Tribute1)
	
	
	
end


SetupMarket2Quest = function(_Where, _Callback)
		Market2Quest = {}
		Market2Quest.AreaPos = _Where
		Market2Quest.AreaSize = 4000
		Market2Quest.EntityTypes = { { Entities.PB_Market2, 1 } }
		
		Market2Quest.Callback = _Callback
	  
		SetupEstablish(Market2Quest)
end


SetupMarket2FirstStepQuest = function(_Where, _Callback)
		Market2QuestFirstStep = {}
		Market2QuestFirstStep.AreaPos = _Where
		Market2QuestFirstStep.AreaSize = 4000
		Market2QuestFirstStep.EntityTypes = { { Entities.PB_Market1, 1 } }
		
		Market2QuestFirstStep.Callback = _Callback
	  
		SetupEstablish(Market2QuestFirstStep)
end


Market2FirstStepBuild = function()
	if(Market2TributeWasPaid ~= 1) then
		SpokenMessage(String.MainKey.."BuildMarket_Note01")
	end
end

Market2Build = function()
	local PositionX, PositionY = Tools.GetPosition("Market2BuildPlace")
	Dummy, FirstMarket2 = Logic.GetPlayerEntitiesInArea(	gvMission.PlayerID, 
										Entities.PB_Market2, 
										PositionX, 
										PositionY,
										Market2Quest.AreaSize,
										1) 
	ChangePlayer(FirstMarket2, gvMission.PlayerIDTrader)
 	if(Market2TributeWasPaid == 1) then
 		Report("Market 2 was built!")
		Market2BuildQuestCompleted()
	else
		Report("Market was built but no tribute has been paid - This is not good...")
		Dummy, FirstMarket2 = Logic.GetPlayerEntitiesInArea(	gvMission.PlayerIDTrader, 
										Entities.PB_Market2, 
										PositionX, 
										PositionY,
										Market2Quest.AreaSize,
										1) 
		SpokenMessage(String.MainKey.."BuildMarket_Note02")
		Logic.SetDiplomacyState( gvMission.PlayerIDTrader, gvMission.PlayerIDBarmecia, Diplomacy.Hostile )
		DestroyQuest = {}
		DestroyQuest.Target = FirstMarket2
		DestroyQuest.Callback = MarketDestroyed
		SetupDestroy(DestroyQuest)
		Logic.GroupAttack(gvMission.DestructionGroup, FirstMarket2)
		DestructionInProgress = 1
	end
	return 1
end


TributePaid = function()
		Market2TributeWasPaid = 1
		if DestructionInProgress == 1 then
			Logic.SetDiplomacyState( gvMission.PlayerIDTrader, gvMission.PlayerIDBarmecia, Diplomacy.Friendly )
			ReturnFromDestruction()
			Market2BuildQuestCompleted()
		end
end


MarketDestroyed = function()
	Logic.SetDiplomacyState( gvMission.PlayerIDTrader, gvMission.PlayerIDBarmecia, Diplomacy.Neutral )
 	ReturnFromDestruction()
	SetupEstablish(Market2Quest)
	SetupEstablish(Market2QuestFirstStep)
	DestructionInProgress = 0
end


Market2BuildQuestCompleted = function()
		--ResolveBriefing(briefingBuildMarket[2])
		Market2WasBuilt = 1
		createBriefingMarket2Built()
		checkLocation("barmecia_market_burning")
end


ReturnFromDestruction = function()
	local BasePosition = GetPosition("DestructionArmyWaitingPoint")
	Logic.GroupAttackMove(gvMission.DestructionGroup, BasePosition.X, BasePosition.Y)
end