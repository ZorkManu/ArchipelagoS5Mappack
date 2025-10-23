
createBriefingKeymaster = function()

	briefingKeymaster =	{}	

	--	briefing finished callback function

		briefingKeymaster.finished = BriefingKeymaster

		local page = 0

	--	page
	
		page = page +1
	
		briefingKeymaster[page] 			= 	{}
		briefingKeymaster[page].title		= 	String.Key("briefingKeymaster[1].title")
		briefingKeymaster[page].text		=	String.Key("briefingKeymaster[1].text")
		briefingKeymaster[page].position 	= 	GetPosition("keymaster")	
		briefingKeymaster[page].dialogCamera = 	true

	--	go!
	
		StartBriefing(briefingKeymaster)
	
	end

BriefingKeymaster = function()


	end	

