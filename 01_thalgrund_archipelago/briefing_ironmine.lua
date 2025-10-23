
createBriefingIronMine = function()

	briefingIronMine = 	{}	

	briefingIronMine.finished = BriefingIronMine

	local page = 0

	--	page
	
		page = page +1
	
		briefingIronMine[page] 			= 	{}
		briefingIronMine[page].title	= 	String.Key("briefingMiner[1].title")
		briefingIronMine[page].text		=	String.Key("briefingIronMine[1].text")
		briefingIronMine[page].position	=	GetPosition("MinerGiveRing")
		briefingIronMine[page].dialogCamera = 	true

	--	page
	
		page = page +1
	
		briefingIronMine[page] 			= 	{}
		briefingIronMine[page].title	= 	String.Key("briefingMiner[1].title")
		briefingIronMine[page].text		=	String.Key("briefingIronMine[2].text")
		briefingIronMine[page].position	=	GetPosition("Ironmine")

	-- Go!
	
		StartBriefing(briefingIronMine)

	end


	
BriefingIronMine = function()

	MoveAndVanish("MinerGiveRing", "RemoveMiner")

	end	
	