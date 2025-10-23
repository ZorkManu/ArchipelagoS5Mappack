
createBriefingDestroyGate = function()

	briefingDestroyGate = 	{}	

	briefingDestroyGate.finished = BriefingDestroyGateFinished

	local page = 0

	--	page
	
		page = page +1
	
		briefingDestroyGate[page] 			= 	{}
		briefingDestroyGate[page].title		= 	String.Key("briefingKeymaster[1].title")
		briefingDestroyGate[page].text		=	String.Key("briefingDestroyGate[1].text")
		briefingDestroyGate[page].position	=	GetPosition("gate")

	--	page

		page = page +1
	
		briefingDestroyGate[page] 			= 	{}
		briefingDestroyGate[page].title		= 	String.Key("briefingKeymaster[1].title")
		briefingDestroyGate[page].text		=	String.Key("briefingDestroyGate[2].text")
		briefingDestroyGate[page].position	=	GetPosition("gate")

	-- Go!
	
		StartBriefing(briefingDestroyGate)

	end
	
BriefingDestroyGateFinished = function()

	ReplaceEntity("gate", Entities.XD_WallStraightGate)

end	
	
