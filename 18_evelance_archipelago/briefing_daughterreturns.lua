
createBriefingDaughterReturns = function()

	briefingDaughterReturns = 	{}	

		briefingDaughterReturns.finished = BriefingDaughterReturns
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingDaughterReturns[page] 			= 	{}
		briefingDaughterReturns[page].title		= 	String.GenericKey("Regent")
		briefingDaughterReturns[page].text		=	String.Key("briefingDaughterReturns[1].text")
		briefingDaughterReturns[page].position 	= 	GetPosition("Major")
--		briefingDaughterReturns[page].dialogCamera 		= 	true

	--	page 2

		page = page +1
	
		briefingDaughterReturns[page] 			= 	{}
		briefingDaughterReturns[page].title		= 	String.GenericKey("Regent")
		briefingDaughterReturns[page].position 	= 	GetPosition("Princess")	
		briefingDaughterReturns[page].text		=	String.Key("briefingDaughterReturns[2].text")
--		briefingDaughterReturns[page].dialogCamera 		= 	true

		
	--	page 3

		page = page +1
	
		briefingDaughterReturns[page] 			= 	{}
		briefingDaughterReturns[page].title		= 	String.GenericKey("Regent")
		briefingDaughterReturns[page].position 	= 	GetPosition("Major")	
		briefingDaughterReturns[page].text		=	String.Key("briefingDaughterReturns[3].text")
--		briefingDaughterReturns[page].dialogCamera 		= 	true
		

	--	page 4

		page = page +1
	
		briefingDaughterReturns[page] 			= 	{}
		briefingDaughterReturns[page].title		= 	String.GenericKey("Mentor")
		briefingDaughterReturns[page].text		=	String.Key("briefingDaughterReturns[4].text")
		briefingDaughterReturns[page].position 	= 	GetPosition("dario")
		briefingDaughterReturns[page].dialogCamera 		= 	true


	--	go!
	
		StartBriefing(briefingDaughterReturns)
	
	end


BriefingDaughterReturns = function()

	-- give player 2000 Taler
	Tools.GiveResouces(GetHumanPlayer(), 2000, 0, 0, 0, 0, 0)
	
end