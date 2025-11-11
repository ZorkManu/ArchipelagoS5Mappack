createBriefingMarket2Built = function()

	BriefingMarket2Built = {}
	BriefingMarket2Built.finished = BriefingMarket2BuiltFinished
	
	local page = 0
	
	page = page +1
	
	BriefingMarket2Built[page] 						= {}
	BriefingMarket2Built[page].title				= String.Key("BriefingMarket2Built[1].title")
	BriefingMarket2Built[page].text					= String.Key("BriefingMarket2Built[1].text")
	
	BriefingMarket2Built[page].npc					= {}
	BriefingMarket2Built[page].npc.id				= GetID("TraderNPC2")
	BriefingMarket2Built[page].npc.isObserved		= true
	
	if(TradeRoute1Established == 1)	then
			ResolveBriefing(PreludeMainquest)
			InitNPC("PilgrimNPC")
			EnableNpcMarker("PilgrimNPC")
		
			page = page +1

			BriefingMarket2Built[page] 				= {}
			BriefingMarket2Built[page].title		= String.GenericKey("Mentor")
			BriefingMarket2Built[page].text			= String.Key("BriefingMainquest[page1].text")
			BriefingMarket2Built[page].position 	= GetPosition("Cathedral")
			BriefingMarket2Built[page].explore		= 1000
			BriefingMarket2Built[page].marker		= ANIMATED_MARKER
				
			BriefingMarket2Built[page].quest		= {}
			BriefingMarket2Built[page].quest.id		= 1
			BriefingMarket2Built[page].quest.type	= MAINQUEST_OPEN
			BriefingMarket2Built[page].quest.title	= String.MainKey.."BriefingMainquest[page1].quest.title"
			BriefingMarket2Built[page].quest.text	= String.MainKey.."BriefingMainquest[page1].quest.text" 
			
	
			BriefingQuestDeliverStone = BriefingMarket2Built[page]
			
			page = page +1

			BriefingMarket2Built[page] 				= {}
			BriefingMarket2Built[page].title		= String.GenericKey("Mentor")
			BriefingMarket2Built[page].text			= String.Key("BriefingMainquest[page2].text")
			BriefingMarket2Built[page].position 	= GetPosition("PilgrimNPC")
			BriefingMarket2Built[page].explore 		= 1000
			BriefingMarket2Built[page].marker		= ANIMATED_MARKER
			
			BriefingMarket2Built[page].quest		= {}
			BriefingMarket2Built[page].quest.id		= 4
			BriefingMarket2Built[page].quest.type	= SUBQUEST_OPEN
			BriefingMarket2Built[page].quest.title	= String.MainKey.."BriefingMainquest[page2].quest.title"
			BriefingMarket2Built[page].quest.text	= String.MainKey.."BriefingMainquest[page2].quest.text" 
			
			BriefingQuestMeetPilgrim = BriefingMarket2Built[page]

			-- inserted by TF
				page = page +1
			
				BriefingMarket2Built[page] 					= 	{}
				BriefingMarket2Built[page].title			= 	String.GenericKey("MissionObjectives")
				BriefingMarket2Built[page].text				=	String.Key("BriefingMainquest[task].text")
				BriefingMarket2Built[page].position 		= 	GetPosition(getLeadingHero())	
				BriefingMarket2Built[page].dialogCamera 	= 	true
			

	end
	
	StartBriefing(BriefingMarket2Built)
end


BriefingMarket2BuiltFinished = function()
	local PositionX, PositionY = Tools.GetPosition("Market2BuildPlace")
	Dummy, FirstMarket2 = Logic.GetPlayerEntitiesInArea(	gvMission.PlayerID, 
											Entities.PB_Market2, 
											PositionX, 
											PositionY,
											Market2Quest.AreaSize,
											1) 
	ChangePlayer(FirstMarket2, gvMission.PlayerIDBarmecia)
	ResolveBriefing(BriefingMarket2Built[1])
	end3rdQuest()
end