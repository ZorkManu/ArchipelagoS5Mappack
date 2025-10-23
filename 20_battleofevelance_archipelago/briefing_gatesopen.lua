
createBriefingGatesOpen = function()

	briefingGatesOpen = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingGatesOpen[page] 			= 	{}
		briefingGatesOpen[page].title		= 	String.GenericKey("Mentor")
		briefingGatesOpen[page].text		=	String.Key("briefingGatesOpen[1].text")
		briefingGatesOpen[page].position	=	GetPosition("InnerGate2")
		briefingGatesOpen[page].explore		=	1500

	--	go!
	
		StartBriefing(briefingGatesOpen)
		
	end