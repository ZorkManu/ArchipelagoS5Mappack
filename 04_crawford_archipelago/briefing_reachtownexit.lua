
createBriefingReachTownExit = function()

	briefingReachTownExit = 	{}	


	briefingReachTownExit.finished = BriefingReachTownExit

		local page = 0

	--	page
	
		page = page +1
		
		briefingReachTownExit[page] 			= 	{}
		briefingReachTownExit[page].title		= 	String.GenericKey("Soldier")
		briefingReachTownExit[page].text		=	String.Key("briefingReachTownExit["..talkToGuard.."].text")
		briefingReachTownExit[page].position	=	GetPosition("Guardian"..talkToGuard)
		briefingReachTownExit[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingReachTownExit)

	end
	

BriefingReachTownExit = function()

end

