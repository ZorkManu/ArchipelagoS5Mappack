createBriefingAriBase = function()

		briefingAriBase 					= 	{}	
                                    	
		briefingAriBase.finished 			=	briefingAriBaseFinished
	                                            	
		local page = 0                          	
                                                	
	--	page 1                                  	
	                                            	
		page = page +1                          	
	                                            	
		briefingAriBase[page] 				= 	{}
--		briefingAriBase[page].title			= 	COLOR2.."< Dario >"
--		briefingAriBase[page].text			=	"We have the key to aris Base."
		briefingAriBase[page].title			= 	String.GenericKey("Mentor")
		briefingAriBase[page].text			=	String.Key("briefingAriBase1.text")
		briefingAriBase[page].position 		= 	GetPosition("KerberosCamp")

	--	page 2
	                                            	
		page = page +1                          	
	                                            	
		briefingAriBase[page] 				= 	{}
--		briefingAriBase[page].title			= 	COLOR2.."< Dario >"
--		briefingAriBase[page].text			=	"The Gate is no problem anymore."
		briefingAriBase[page].title			= 	String.GenericKey("Mentor")
		briefingAriBase[page].text			=	String.Key("briefingAriBase2.text")
		briefingAriBase[page].position 		= 	GetPosition("AriGate1")
		briefingAriBase[page].explore		=	500
		briefingAriBase[page].marker		=	STATIC_MARKER
		
		GatePage = briefingAriBase[2]


	--	page 3
	
		page = page +1     
	
		briefingAriBase[page] 				= 	{}
--		briefingAriBase[page].title			= 	MISSION_OBJECTIVES
--		briefingAriBase[page].text			=	COLOR0.."1)"..COLOR1.."Finally catch thief Ari."
		briefingAriBase[page].title			= 	String.GenericKey("MissionObjectives")
		briefingAriBase[page].text			=	String.Key("briefingAriBase3.text")
		briefingAriBase[page].position 		= 	{}
		briefingAriBase[page].position.X,
		briefingAriBase[page].position.Y 	= 	Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingAriBase)


end
