
createBriefingMiner = function()

	briefingMiner = {}	

	briefingMiner.finished = BriefingMinerFinished

	local page = 0

	--	page
	
		page = page +1

		page_ring = page
	
		briefingMiner[page] 			= 	{}
		briefingMiner[page].title		= 	String.Key("briefingMiner[1].title")
		briefingMiner[page].text		=	String.Key("briefingMiner[1].text")
		briefingMiner[page].position	=	GetPosition("Miner")
		briefingMiner[page].dialogCamera 	= 	true

		briefingMiner[page].quest		=	{}
		briefingMiner[page].quest.id	=	5
--		briefingMiner[page].quest.type	=	MAINQUEST_OPEN
		briefingMiner[page].quest.type	=	SUBQUEST_OPEN
		briefingMiner[page].quest.title	=	String.MainKey.."briefingMiner[2].quest.title"
		briefingMiner[page].quest.text	=	String.MainKey.."briefingMiner[2].quest.text"

	--	page
	
		page = page +1
	
		briefingMiner[page] 			= 	{}
		briefingMiner[page].title		= 	String.Key("briefingMiner[1].title")
		briefingMiner[page].text		=	String.Key("briefingMiner[2].text")
		briefingMiner[page].position 	= 	GetPosition("Miner")	
		briefingMiner[page].dialogCamera 	= 	true


	--	page
	
		page = page +1

		briefingMiner[page]				= 	{}
		briefingMiner[page].title		=	String.GenericKey("MissionObjectives")
		briefingMiner[page].position	=	GetPosition(getLeadingHero())
		briefingMiner[page].dialogCamera 	= 	true
		briefingMiner[page].text		=	{	String.Key("briefingMiner[task1].text"),
												String.Key("briefingMiner[task2].text")
											}

	--	go!

		StartBriefing(briefingMiner)

	end
	
	
	
BriefingMinerFinished = function()

	end	
	
