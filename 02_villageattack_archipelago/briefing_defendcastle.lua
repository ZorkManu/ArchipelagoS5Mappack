createBriefingDefendCastlePrelude = function()

	-- NOT USED!
	
	briefingDefendCastlePrelude = 	{}	
	
	briefingDefendCastlePrelude.finished = BriefingDefendCastleFinishedPrelude

		local page = 0

	--	page
	
		page = page +1

		briefingDefendCastlePrelude[page] 					= 	{}
		briefingDefendCastlePrelude[page].title				= 	String.GenericKey("Mentor")
		briefingDefendCastlePrelude[page].text				=	String.Key("briefingDefendCastle[1].text")
		briefingDefendCastlePrelude[page].position			=	GetPosition(getLeadingHero())

	--	go!
	
		StartBriefing(briefingDefendCastlePrelude)

end


BriefingDefendCastleFinishedPrelude = function()

	StartBinkVideo("VillageAttack1")

end



--------------------------------------------------------------------------------------------------------------------------------

createBriefingDefendCastle = function()

	briefingDefendCastle = 	{}	
	
	briefingDefendCastle.finished = BriefingDefendCastleFinished

		local page = 0

--	--	page
--	
--		page = page +1
--
--		briefingDefendCastle[page] 					= 	{}
--		briefingDefendCastle[page].title			= 	String.GenericKey("Mentor")
--		briefingDefendCastle[page].text				=	String.Key("briefingDefendCastle[1].text")
--		briefingDefendCastle[page].position			=	GetPosition("castle")
--		briefingDefendCastle[page].marker			=	ANIMATED_MARKER
--
--		page_defendCastle = page
--	
--		briefingDefendCastle[page].quest			=	{}
--		briefingDefendCastle[page].quest.id			=	2
--		briefingDefendCastle[page].quest.type		=	MAINQUEST_OPEN
--		briefingDefendCastle[page].quest.title		=	String.MainKey.."briefingDefendCastle[1].quest.title"
--		briefingDefendCastle[page].quest.text		=	String.MainKey.."briefingDefendCastle[1].quest.text"

	--	page

		page = page +1

		page_destroyTower1 = page

		briefingDefendCastle[page] 					= 	{}
		briefingDefendCastle[page].title			= 	String.GenericKey("Mentor")
		briefingDefendCastle[page].text				=	String.Key("briefingDefendCastle[2].text")
		briefingDefendCastle[page].position			=	GetPosition("tower1")
		briefingDefendCastle[page].explore			=	2000
		briefingDefendCastle[page].marker			=	ANIMATED_MARKER

	--	page

		page = page +1

		page_rescueLeonardo = page

		briefingDefendCastle[page] 					= 	{}
		briefingDefendCastle[page].text				=	String.Key("briefingDefendCastle[3].text")
		briefingDefendCastle[page].position			=	GetPosition("Leonardo")
		briefingDefendCastle[page].explore			=	1000
		briefingDefendCastle[page].marker			=	STATIC_MARKER
		briefingDefendCastle[page].dialogCamera 	= 	true


	--	page

		page = page +1

		page_destroyTower2 = page

		briefingDefendCastle[page] 					= 	{}
		briefingDefendCastle[page].text				=	String.Key("briefingDefendCastle[4].text")
		briefingDefendCastle[page].position			=	GetPosition("tower2")
		briefingDefendCastle[page].explore			=	2000
		briefingDefendCastle[page].marker			=	ANIMATED_MARKER


	--	page	
	
		page = page +1
		page_defendCastle = page
	
		briefingDefendCastle[page] 					= 	{}
		briefingDefendCastle[page].title			= 	String.GenericKey("MissionObjectives")
		briefingDefendCastle[page].position			=	GetPosition("castle")
		briefingDefendCastle[page].marker			=	ANIMATED_MARKER

		briefingDefendCastle[page].quest			=	{}
		briefingDefendCastle[page].quest.id			=	2

		briefingDefendCastle[page].quest.type		=	MAINQUEST_OPEN
		briefingDefendCastle[page].quest.title		=	String.MainKey.."briefingDefendCastle[1].quest.title"
		briefingDefendCastle[page].quest.text		=	String.MainKey.."briefingDefendCastle[1].quest.text"

		briefingDefendCastle[page].text				=	{	String.Key("briefingDefendCastle[task1].text"),
															String.Key("briefingDefendCastle[task2].text")
														}

	--	go!
	
		StartBriefing(briefingDefendCastle)

	end
	


BriefingDefendCastleFinished = function()

	createQuestRescueLeonardo()

end
