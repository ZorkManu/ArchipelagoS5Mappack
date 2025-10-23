
createBriefingMinerGiveRing = function()

	briefingMinerGiveRing = {}	

	briefingMinerGiveRing.finished = BriefingMinerGiveRingFinished

	local page = 0

	--	page
	
		page = page +1

		briefingMinerGiveRing[page] 			= 	{}
		briefingMinerGiveRing[page].title		= 	String.GenericKey("Mentor")
		briefingMinerGiveRing[page].text		=	String.Key("briefingMinerGiveRing[1].text")
		briefingMinerGiveRing[page].position	=	GetPosition(getLeadingHero())
		briefingMinerGiveRing[page].dialogCamera 	= 	true

	
	--	page
	
		page = page +1

		briefingMinerGiveRing[page]				= 	{}
		briefingMinerGiveRing[page].title		= 	String.GenericKey("Mentor")
		briefingMinerGiveRing[page].text		=	String.Key("briefingMinerGiveRing[2].text")
		briefingMinerGiveRing[page].position	=	GetPosition("MinerGiveRing")
		briefingMinerGiveRing[page].explore		=	2000
		briefingMinerGiveRing[page].dialogCamera 	= 	true


	--	go!

		StartBriefing(briefingMinerGiveRing)

	end
	
	
	
BriefingMinerGiveRingFinished = function()

	end	
	
