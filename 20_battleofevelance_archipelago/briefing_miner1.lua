
createBriefingMiner1 = function()

	briefingMiner1 = 	{}	

	briefingMiner1.finished = BriefingMiner1


	local page = 0

	--	page 1
	
		page = page +1
	
		briefingMiner1[page] 			= 	{}
		briefingMiner1[page].title		= 	String.Key("briefingMiner1[1].title")
		briefingMiner1[page].text		=	String.Key("briefingMiner1[1].text")
		briefingMiner1[page].position	=	GetPosition("Miner1")
		briefingMiner1[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingMiner1[page] 			= 	{}
		briefingMiner1[page].title		= 	String.Key("briefingMiner1[1].title")
		briefingMiner1[page].text		=	String.Key("briefingMiner1[2].text")
		briefingMiner1[page].position	=	GetPosition("OldTree")
		briefingMiner1[page].explore	=	1500

	--	page
	
		page = page +1
	
		briefingMiner1[page] 			= 	{}
		briefingMiner1[page].title		= 	String.Key("briefingMiner1[1].title")
		briefingMiner1[page].text		=	String.Key("briefingMiner1[3].text")
		briefingMiner1[page].position	=	GetPosition("sulfurMine")
		briefingMiner1[page].explore	=	1500

	--	page
	
		page = page +1
	
		briefingMiner1[page] 			= 	{}
		briefingMiner1[page].title		= 	String.Key("briefingMiner1[1].title")
		briefingMiner1[page].text		=	String.Key("briefingMiner1[4].text")
		briefingMiner1[page].position	=	GetPosition("Miner1")
		briefingMiner1[page].dialogCamera 		= 	true


	--	go!
	
		StartBriefing(briefingMiner1)
		
	end
	
	
	
	
BriefingMiner1 = function()
	
--		ResolveBriefing(briefingMiner1[MinerPos])

	if IsAlive("Miner1_target") then
		MoveAndVanish("Miner1", "Miner1_target")
	end

end