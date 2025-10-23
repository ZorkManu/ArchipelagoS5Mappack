createBriefingAriHeliasDied = function()

		briefingAriHeliasDied					= 	{}	

	
		briefingAriHeliasDied.finished 			=	briefingAriHeliasDiedFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingAriHeliasDied[page] 				= 	{}
		briefingAriHeliasDied[page].title			= 	String.GenericKey("Mentor")
		briefingAriHeliasDied[page].text			=	String.Key("briefingAriHeliasDied[1].text")
		briefingAriHeliasDied[page].position 		= 	GetPosition("Ari")
		briefingAriHeliasDied[page].explore			=	1000
		briefingAriHeliasDied[page].dialogCamera 	= 	true
	
	--	page 2

		page = page +1
	
		briefingAriHeliasDied[page] 				= 	{}
		briefingAriHeliasDied[page].title			= 	String.GenericKey("Mentor")
		briefingAriHeliasDied[page].text			=	String.Key("briefingAriHeliasDied[2].text")
		briefingAriHeliasDied[page].position 		= 	{}
		briefingAriHeliasDied[page].position.X,
		briefingAriHeliasDied[page].position.Y 		=	Camera.ScrollGetLookAt()
	
	--	go!
	
		StartBriefing(briefingAriHeliasDied)
	
end

briefingAriHeliasDiedFinished = function()

	ResolveBriefing(briefingAriHeliasDied[1])
	
end