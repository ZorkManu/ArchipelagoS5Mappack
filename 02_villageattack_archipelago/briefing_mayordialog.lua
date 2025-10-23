
createBriefingMayorDialog = function()

	briefingMayorDialog = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingMayorDialog[page] 			= 	{}
		briefingMayorDialog[page].title		= 	String.Key("briefingMayorDialog[1].title")
		briefingMayorDialog[page].text		=	String.Key("briefingMayorDialog[1].text")
		briefingMayorDialog[page].position	=	GetPosition("Mayor_north")
		briefingMayorDialog[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingMayorDialog[page] 			= 	{}
		briefingMayorDialog[page].title		= 	String.Key("briefingMayorDialog[1].title")
		briefingMayorDialog[page].text		=	String.Key("briefingMayorDialog[2].text")
		briefingMayorDialog[page].position	=	GetPosition("cave1")

	--	page
	
		page = page +1
	
		briefingMayorDialog[page] 			= 	{}
		briefingMayorDialog[page].title		= 	String.Key("briefingMayorDialog[1].title")
		briefingMayorDialog[page].text		=	String.Key("briefingMayorDialog[3].text")
		briefingMayorDialog[page].position	=	GetPosition("Mayor_north")
		briefingMayorDialog[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingMayorDialog[page] 			= 	{}
		briefingMayorDialog[page].title		= 	String.Key("briefingMayorDialog[1].title")
		briefingMayorDialog[page].text		=	String.Key("briefingMayorDialog[4].text")
		briefingMayorDialog[page].position	=	GetPosition("village1")

	--	go!
	
		StartBriefing(briefingMayorDialog)
		
	end
	