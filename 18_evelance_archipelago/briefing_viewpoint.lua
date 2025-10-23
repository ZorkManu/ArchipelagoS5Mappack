
createBriefingViewPoint = function()


		briefingViewPoint = 	{}	

		briefingViewPoint.finished = BriefingViewPoint

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingViewPoint[page] 				= 	{}
		briefingViewPoint[page].title			= 	String.GenericKey("Hermit")
		briefingViewPoint[page].text			=	String.Key("briefingViewPoint[1].text")
		briefingViewPoint[page].position 		= 	GetPosition("TellAboutViewPoint")	
		briefingViewPoint[page].dialogCamera 	= 	true


	--	page 2
	
		page = page +1
		ViewPointPage = page
	
		briefingViewPoint[page] 				= 	{}
		briefingViewPoint[page].title			= 	String.GenericKey("Hermit")
		briefingViewPoint[page].text			=	String.Key("briefingViewPoint[2].text")
		briefingViewPoint[page].position 		= 	GetPosition("ViewPoint")	
		briefingViewPoint[page].marker			=	ANIMATED_MARKER
		briefingViewPoint[page].explore			=	1000

	--	page 3
	
		page = page +1
	
		briefingViewPoint[page] 				= 	{}
		briefingViewPoint[page].title			= 	String.GenericKey("Hermit")
		briefingViewPoint[page].text			=	String.Key("briefingViewPoint[3].text")
		briefingViewPoint[page].position 		= 	GetPosition("TellAboutViewPoint")	
		briefingViewPoint[page].dialogCamera 	= 	true


	--	go!
	
		StartBriefing(briefingViewPoint)
	
end


BriefingViewPoint = function()

	DisableNpcMarker("TellAboutViewPoint")
	
end
