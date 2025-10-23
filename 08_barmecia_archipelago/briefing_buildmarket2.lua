
createBriefingBuildMarket = function()
	BriefingBuildMarket = {}
	BriefingBuildMarket.finished = BriefingBuildMarket2Finished
	
	local page = 0
	
	
	page = page +1
	
	BriefingBuildMarket[page] 					= {}
	BriefingBuildMarket[page].title				= String.Key("BriefingBuildMarket[1].title")
	BriefingBuildMarket[page].text				= String.Key("BriefingBuildMarket[1].text")
	BriefingBuildMarket[page].position			= GetPosition("Trader2")
	
	page = page +1
	
	BriefingBuildMarket[page] 					= {}
	BriefingBuildMarket[page].title				= String.Key("BriefingBuildMarket[1].title")
	BriefingBuildMarket[page].position 			= GetPosition("Trader2")	
	BriefingBuildMarket[page].text				= String.Key("BriefingBuildMarket[2].text")
	BriefingBuildMarket[page].pointer			= GetPosition("Trader2")
		
	BriefingBuildMarket[page].quest				= {}
	BriefingBuildMarket[page].quest.id			= 3
	BriefingBuildMarket[page].quest.type		= SUBQUEST_OPEN
	BriefingBuildMarket[page].quest.title		= String.MainKey.."BriefingBuildMarket[2].quest.title"
	BriefingBuildMarket[page].quest.text		= String.MainKey.."BriefingBuildMarket[2].quest.text" 
	
	BriefingBuildMarketQuest = BriefingBuildMarket[page]
	
	page = page +1
	
	BriefingBuildMarket[page] 					= {}
	BriefingBuildMarket[page].title				= String.Key("BriefingBuildMarket[1].title")
	BriefingBuildMarket[page].position 			= GetPosition("Trader2")	
	BriefingBuildMarket[page].text				= String.Key("BriefingBuildMarket[3].text")

	-- inserted by TF
		page = page +1
	
		BriefingBuildMarket[page] 					= 	{}
		BriefingBuildMarket[page].title				= 	String.GenericKey("MissionObjectives")
		BriefingBuildMarket[page].text				=	String.Key("BriefingBuildMarket[task].text")
		BriefingBuildMarket[page].position 			= 	GetPosition("Dario")	
		BriefingBuildMarket[page].dialogCamera 		= 	true
		
	
	StartBriefing(BriefingBuildMarket)
end


BriefingBuildMarket2Finished = function()

	local TraderID = Logic.GetEntityIDByName("Trader2")
	Logic.HurtEntity(TraderID, Logic.GetEntityHealth(TraderID))
	Logic.SetDiplomacyState( gvMission.PlayerIDTrader, gvMission.PlayerIDBarmecia, Diplomacy.Friendly )
	ReturnFromDestruction()
end