createBriefingSommer = function()

	briefingSommer						= 	{}	
                                    	
	briefingSommer.finished 			=	briefingSommerFinished
  	EnableNpcMarker("Garek")
                                    	
	local page = 0                  	
                                    	
--	page 1                          	
                                    	
	page = page +1                  	
                                    	
	briefingSommer[page] 				= 	{}
	briefingSommer[page].title			= 	String.Key("briefingGarek[1].title")
	briefingSommer[page].text			=	String.Key("briefingSommer[1].text")
	briefingSommer[page].position 		= 	GetPosition("Garek")
	briefingSommer[page].explore 		= 	1400
	briefingSommer[page].dialogCamera 	= 	true
                                    	
--	page 2                          	
                                    	
	page = page +1                  	
                                    	
	briefingSommer[page] 				= 	{}
	briefingSommer[page].title			= 	String.Key("briefingGarek[1].title")
	briefingSommer[page].text			=	String.Key("briefingSommer[2].text")
	briefingSommer[page].position 		= 	GetPosition("FrozenWater")
	briefingSommer[page].explore 		= 	2000
	                                    	
	briefingSommer[page].quest			=	{}
	briefingSommer[page].quest.id		=	2
	briefingSommer[page].quest.type		=	MAINQUEST_OPEN
	briefingSommer[page].quest.title	=	String.MainKey.."briefingSommer[2].quest.title"
	briefingSommer[page].quest.text		=	String.MainKey.."briefingSommer[2].quest.text"

	sommerPage							=	briefingSommer[page]
                                    	
--	page 3

	page = page +1                  	
	pageCorn = page
                                    	
	briefingSommer[page] 				= 	{}
	briefingSommer[page].title			= 	String.Key("briefingGarek[1].title")
	briefingSommer[page].text			=	String.Key("briefingSommer[3].text")
	briefingSommer[page].position 		= 	GetPosition("CornField")
	briefingSommer[page].explore 		= 	2000


--	page 4
                                    	
	page = page + 1                 	
                                    	
	briefingSommer[page] 				= 	{}
	briefingSommer[page].title			= 	String.GenericKey("MissionObjectives")
	briefingSommer[page].position 		= 	{}
	briefingSommer[page].position.X,
	briefingSommer[page].position.Y 	=	Camera.ScrollGetLookAt()
	
	briefingSommer[page].text			=	String.Key("briefingSommer[4].text")


--	go!

	StartBriefing(briefingSommer)

end

briefingSommerFinished = function()

	DisableNpcMarker("Garek")
	ResolveBriefing(briefingSommer[pageCorn])
	
end