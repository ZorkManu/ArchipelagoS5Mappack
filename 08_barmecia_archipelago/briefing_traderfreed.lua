createBriefingTraderFreed = function()
	BriefingTraderFreed = {}
	BriefingTraderFreed.finished = end2ndQuest 
	
	local page = 0
	
	page = page +1
	
	BriefingTraderFreed[page] 							= 	{}
	BriefingTraderFreed[page].title					= 	String.Key("BriefingTraderFreed[1].title")
	BriefingTraderFreed[page].text					=	String.Key("BriefingTraderFreed[1].text")
	BriefingTraderFreed[page].explore				= 4000
	BriefingTraderFreed[page].position			= GetPosition("TraderMarket1")
	
	BriefingTraderFreed[page].npc						=	{}
	BriefingTraderFreed[page].npc.id				=	GetID("TraderMarket1")
	BriefingTraderFreed[page].npc.isObserved	=	true
	
	if(TradeRoute2Established == 1)	then
			ResolveBriefing(PreludeMainquest)
			InitNPC("PilgrimNPC")
			EnableNpcMarker("PilgrimNPC")
		
			page = page +1

			BriefingTraderFreed[page] 				= {}
			BriefingTraderFreed[page].title	= String.GenericKey("Mentor")
			BriefingTraderFreed[page].text		=	String.Key("BriefingMainquest[page1].text")
			BriefingTraderFreed[page].position = GetPosition("Cathedral")
			BriefingTraderFreed[page].explore	= 1000
			BriefingTraderFreed[page].marker		=	ANIMATED_MARKER
				
			BriefingTraderFreed[page].quest					=	{}
			BriefingTraderFreed[page].quest.id			=	1
			BriefingTraderFreed[page].quest.type		=	MAINQUEST_OPEN
			BriefingTraderFreed[page].quest.title		=	String.MainKey.."BriefingMainquest[page1].quest.title"
			BriefingTraderFreed[page].quest.text		=	String.MainKey.."BriefingMainquest[page1].quest.text" 
	
			BriefingQuestDeliverStone = BriefingTraderFreed[page]
			
			page = page +1

			BriefingTraderFreed[page] 				= {}
			BriefingTraderFreed[page].title	= String.GenericKey("Mentor")
			BriefingTraderFreed[page].text		=	String.Key("BriefingMainquest[page2].text")
			BriefingTraderFreed[page].position = GetPosition("PilgrimNPC")
			BriefingTraderFreed[page].explore = 1000
			BriefingTraderFreed[page].marker		=	ANIMATED_MARKER
			
			BriefingTraderFreed[page].quest					=	{}
			BriefingTraderFreed[page].quest.id			=	4
			BriefingTraderFreed[page].quest.type		=	SUBQUEST_OPEN
			BriefingTraderFreed[page].quest.title		=	String.MainKey.."BriefingMainquest[page2].quest.title"
			BriefingTraderFreed[page].quest.text		=	String.MainKey.."BriefingMainquest[page2].quest.text" 
			
			BriefingQuestMeetPilgrim = BriefingTraderFreed[page]
	end
	
	
	StartBriefing(BriefingTraderFreed)
end
